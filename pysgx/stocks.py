from io import StringIO
import numpy as np
import pandas as pd


class ADTV(float):
    def __str__(self):
        return f"{int(self):,}"


class Stock:
    def __init__(self, price: pd.DataFrame, dividend: pd.DataFrame):
        self.price = price
        self.dividend = dividend

    def get_adtv(self, start_date: str, end_date: str) -> ADTV:
        # Average Daily Trading Volume
        df = self.price.loc[self.price["Day"] >= start_date].loc[self.price["Day"] <= end_date]
        if len(df) == 0:
            return NaN
        return ADTV(df["Close"].dot(df["Volume"]) / len(df))


class StockReturn:
    def __init__(self, ByAdjClose: float, ByAddBackClose: float):
        self.ByAdjClose = ByAdjClose
        self.ByAddBackClose = ByAddBackClose

    def __str__(self):
        return "ByAdjClose: {:.6f} ByAddBackClose: {:.6f}".format(self.ByAdjClose, self.ByAddBackClose)


class StockRisk(StockReturn):
    pass


NaN = np.NaN


def load_dividend(ticker: str):
    fname = "data/" + ticker + ".csv"
    df = pd.read_csv(fname)
    df = df[df['Dividends'] > 0]
    df['Date'] = pd.to_datetime(df['Date']).dt.date
    df['Day'] = df['Date'].apply(lambda x: x.strftime('%Y-%m-%d'))
    return df


def load_price(ticker: str):
    fname = "data_latest/" + ticker + ".csv"
    df = pd.read_csv(fname)
    df['Date'] = pd.to_datetime(df['Date']).dt.date
    df["Day"] = df['Date'].apply(lambda x: x.strftime('%Y-%m-%d'))
    return df


def load(ticker: str) -> Stock:
    return Stock(load_price(ticker), load_dividend(ticker))


def list_dividend(start_day: str, stock: Stock) -> pd.DataFrame:
    # List dividend of the stock since given start_day like "2022-01-01"
    df = stock.dividend[stock.dividend["Day"] >= start_day]
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


def get_return_diff(r: StockReturn) -> float:
    return r.ByAdjClose / r.ByAddBackClose - 1


def get_addback_close(stock: Stock, start_date="", end_date="") -> pd.DataFrame:
    ''' Get stock with "Close", "Adj Close" and "AddBackClose" between start_date and end_date
    If end_date is not given, it will use up to the latest date: 2024-03-15
    If start_date is not given, it will use up earlist date possible: 2000-01-01
    '''
    df = stock.price[["Day", "Close", "Adj Close"]]
    df2 = stock.dividend[["Day", "Dividends"]]

    if start_date != "":
        df = df[df['Day'] >= start_date]
        df2 = df2[df2["Day"] > start_date]

    if end_date != "":
        df = df[df['Day'] <= end_date]
        df2 = df2[df2['Day'] <= end_date]

    col = df.apply(lambda row: row.Close + df2[row.Day > df2["Day"]].Dividends.sum(), axis=1)
    df = df.assign(AddBackClose=col.values)
    return df


def get_risk(start_date: str, end_date: str, stock: Stock) -> StockRisk:
    df = get_addback_close(stock, start_date, end_date)
    if len(df) == 0:
        return StockRisk(NaN, NaN)

    risk_adj_close = df["Adj Close"].pct_change().dropna().var()
    risk_addback_close = df["AddBackClose"].pct_change().dropna().var()

    return StockRisk(risk_adj_close, risk_addback_close)


def get_return(buy_day: str, sell_day: str, stock: Stock) -> StockReturn:
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

    dividends = stock.dividend[(stock.dividend.Day > buy_day) & (stock.dividend.Day < sell_day)].Dividends.sum()

    print("Total Dividend: {:.6f}\n".format(dividends))
    ByAddBackClose = (sell["Close"] + dividends) / buy["Close"] - 1

    print("# Actual Return by adding back dividend")
    print("buy: {:.6f} sell: {:.6f} gain: {:.6f}".format(buy["Close"],
                                                         sell["Close"] +
                                                         dividends,
                                                         sell["Close"] + dividends - buy["Close"]))
    print("return: {:.2f}% ({:.6f})".format(ByAddBackClose*100, ByAddBackClose))
    print("")

    r = StockReturn(ReturnByAdjClose, ByAddBackClose)
    print("# Return difference")
    d = get_return_diff(r)
    print("{:.2f}% ({:.6f})".format(d*100, d))
    return r
