from io import StringIO
import numpy as np
import pandas as pd


class Stock:
    def __init__(self, price, dividend):
        self.price = price
        self.dividend = dividend


class StockReturn:
    def __init__(self, ByAdjClose, ByActual):
        self.ByAdjClose = ByAdjClose
        self.ByActual = ByActual


NaN = np.NaN


def load_dividend(ticker):
    fname = "data/" + ticker + ".csv"
    df = pd.read_csv(fname)
    df = df[df['Dividends'] > 0]
    df['Date'] = pd.to_datetime(df['Date']).dt.date
    df['Day'] = df['Date'].apply(lambda x: x.strftime('%Y-%m-%d'))
    return df


def load_price(ticker):
    fname = "data_latest/" + ticker + ".csv"
    df = pd.read_csv(fname)
    df['Date'] = pd.to_datetime(df['Date']).dt.date
    df["Day"] = df['Date'].apply(lambda x: x.strftime('%Y-%m-%d'))
    return df


def load(ticker):
    return Stock(load_price(ticker), load_dividend(ticker))


def list_dividend(backday, stock):
    df = stock.dividend[stock.dividend["Day"] >= backday]
    print("== csv")
    print("")

    result = ""

    result += "Day,Close,Original Close,Dividends,Adjustment Factor\n"

    # Initialize the total adjustment factor
    total_adjustment_factor = 1

    # Iterate through the DataFrame in reverse order
    for i in range(len(df) - 1, -1, -1):
        row = df.iloc[i]
        oclose = row['Close'] / total_adjustment_factor
        adjustment_factor = oclose / (oclose + row['Dividends'])
        total_adjustment_factor *= adjustment_factor

        # Print the calculated values
        result += f"{row['Day']},{row['Close']},{oclose},{row['Dividends']},{adjustment_factor}\n"

    print(result)
    # Print the total adjustment factor
    print("\ntotal_adjustment_factor:", total_adjustment_factor)

    print("")
    df = pd.read_csv(StringIO(result))
    return df


def get_return_diff(r):
    return r.ByAdjClose / r.ByActual - 1


def get_return(buy_day, sell_day, stock):
    # Finding the index of the buy_day and sell_day
    buy_index = stock.price[stock.price['Day'] <= buy_day].index.max()
    sell_index = stock.price[stock.price['Day'] <= sell_day].index.max()

    if pd.isna(buy_index) or pd.isna(sell_index):
        return StockReturn(NaN, NaN)

    buy = stock.price.loc[buy_index]
    sell = stock.price.loc[sell_index]
    print("# Return by Adj Close")
    print("buy: {:.6f} sell: {:.6f} gain: {:.6f}\n".format(buy["Adj Close"],
                                                           sell["Adj Close"],
                                                           sell["Adj Close"] - buy["Adj Close"]))
    ReturnByAdjClose = sell["Adj Close"] / buy["Adj Close"] - 1
    print("return: {:.2f}% ({:.6f})".format(
        ReturnByAdjClose*100, ReturnByAdjClose))

    dividends = stock.dividend[(stock.dividend.Day > buy_day) & (
        stock.dividend.Day < sell_day)].Dividends.sum()

    print("Total Dividend: {:.6f}\n".format(dividends))
    ByActual = (sell["Close"] + dividends) / buy["Close"] - 1

    print("# Actual Return by adding back dividend")
    print("buy: {:.6f} sell: {:.6f} gain: {:.6f}".format(buy["Close"],
                                                         sell["Close"] +
                                                         dividends,
                                                         sell["Close"] + dividends - buy["Close"]))
    print("return: {:.2f}% ({:.6f})".format(ByActual*100, ByActual))
    print("")

    r = StockReturn(ReturnByAdjClose, ByActual)
    print("# Return difference")
    d = get_return_diff(r)
    print("{:.2f}% ({:.6f})".format(d*100, d))
    return r
