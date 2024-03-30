from dataclasses import dataclass
from . import info
from .util import YearMonth
from io import StringIO
import numpy as np
from typing import List
import pandas as pd


class Number(float):
    def __str__(self):
        try:
            return f"{int(self):,}"
        except ValueError:
            return "nan"


@dataclass
class Stock:
    ticker: str
    price: pd.DataFrame
    dividend: pd.DataFrame

    def get_avg_adtv(self) -> Number:
        return Number(info.get_avg_vol(self.ticker))

    def get_adtv(self, start_day: str | YearMonth, end_day: str | YearMonth) -> Number:
        # Get Average Daily Trading Volume during the period
        start_date = str(start_day)
        end_date = str(end_day)

        df = self.price.loc[self.price["Day"] >= start_date].loc[self.price["Day"] <= end_date]
        if len(df) == 0:
            return NaN
        return Number(df["Close"].dot(df["Volume"]) / len(df))

    def get_mc(self) -> Number:
        return Number(info.get_mc(self.ticker))

    def get_sector(self) -> str:
        return info.info[self.ticker]["sector"]

    def get_industry(self) -> str:
        return info.info[self.ticker]["industry"]

    def get_pe_ratio(self) -> str:
        return info.qt[self.ticker]["PE Ratio (TTM)"]

    def __str__(self):
        return f"| {self.ticker} | {self.get_mc()} | {self.get_pe_ratio()} | {self.get_sector()} | {self.get_industry()} | {self.get_avg_adtv()} |"


@dataclass
class StockReturn:
    ByAdjClose: float
    ByAddBackClose: float

    def __str__(self):
        gap = ""
        if self.ByAdjClose > 0:
            gap = " "
        return f"ByAdjClose: {gap}{self.ByAdjClose:.6f} ByAddBackClose: {gap}{self.ByAddBackClose:.6f}"


class StockRisk(StockReturn):
    pass


@dataclass
class StockWeights:
    ByAdjClose: List[float]
    ByAddBackClose: List[float]


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


def loads(tickers: List[str]) -> List[Stock]:
    # Load list of stock info(both price / dividend history) with given list of tickers
    result: List[Stock] = []
    for ticker in tickers:
        result.append(load(ticker))
    return result


def load(ticker: str) -> Stock:
    # Load stock info(both price / dividend history) with given ticker
    return Stock(ticker, load_price(ticker), load_dividend(ticker))


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
    if r.ByAddBackClose == 0:
        return 0
    return r.ByAdjClose / r.ByAddBackClose - 1


def get_addback_close(stock: Stock, start_day="", end_date="") -> pd.DataFrame:
    ''' Get stock with "Close", "Adj Close" and "AddBackClose" between start_date and end_date
    If end_date is not given, it will use up to the latest date: 2024-03-15
    If start_day is not given, it will use up earlist date possible: 2000-01-01
    '''
    df = stock.price[["Day", "Close", "Adj Close"]]
    df2 = stock.dividend[["Day", "Dividends"]]

    buy_day = str(start_day)
    sell_day = str(end_date)

    if buy_day != "":
        df = df[df['Day'] >= buy_day]
        df2 = df2[df2["Day"] > buy_day]

    if sell_day != "":
        df = df[df['Day'] <= sell_day]
        df2 = df2[df2['Day'] <= sell_day]

    col = df.apply(lambda row: row.Close + df2[row.Day > df2["Day"]].Dividends.sum(), axis=1)
    df = df.assign(AddBackClose=col.values)
    return df


def get_risk(start_day: str | YearMonth, end_day: str | YearMonth, stock: Stock) -> StockRisk:
    # get risk of given stock during the period
    df = get_addback_close(stock, start_day, end_day)
    if len(df) == 0:
        return StockRisk(NaN, NaN)

    risk_adj_close = df["Adj Close"].pct_change().dropna().var()
    risk_addback_close = df["AddBackClose"].pct_change().dropna().var()

    return StockRisk(risk_adj_close, risk_addback_close)


def get_portfolio_return(start_day: str | YearMonth, end_day: str | YearMonth, portfolio: List[Stock], weights: List[float] = []) -> StockReturn:
    '''Get return of given portfolio during the period
       If weights is not given, assume equal weights
    '''
    returns = get_returns(start_day, end_day, portfolio)

    if len(weights) == 0:
        weights = [1/len(portfolio)] * len(portfolio)

    ByAdjClose = [r.ByAdjClose for r in returns]
    ByAddBackClose = [r.ByAddBackClose for r in returns]
    return StockReturn(np.dot(ByAdjClose, weights), np.dot(ByAddBackClose, weights))


def get_returns(start_day: str | YearMonth, end_day: str | YearMonth, stocks: List[Stock]) -> List[StockReturn]:
    # Same as: [get_return(buy_day, sell_day, stock) for stock in stocks]
    result: List[StockReturn] = []
    for stock in stocks:
        r = get_return(start_day, end_day, stock, False)
        result.append(r)

    return result


def get_risks(start_day: str | YearMonth, end_day: str | YearMonth, stocks: List[Stock]) -> List[StockRisk]:
    return [get_risk(start_day, end_day, stock) for stock in stocks]


def get_weights_by_returns(returns: List[StockReturn]) -> StockWeights:
    # Higher the return, lower the weight

    SumByAdjClose = sum([r.ByAdjClose for r in returns])
    SumByAddBackClose = sum([r.ByAddBackClose for r in returns])

    return StockWeights([r.ByAdjClose / SumByAdjClose for r in returns], [r.ByAddBackClose / SumByAddBackClose for r in returns])


def get_weights_by_risks(risks: List[StockRisk]) -> StockWeights:
    # Higher the risk, lower the weight
    SumByAdjClose = sum([r.ByAdjClose for r in risks])
    SumByAddBackClose = sum([r.ByAddBackClose for r in risks])

    RiskByAdjClose = [1 - r.ByAdjClose / SumByAdjClose for r in risks]
    RiskByAddBackClose = [1 - r.ByAddBackClose / SumByAddBackClose for r in risks]

    SumByAdjClose = sum(RiskByAdjClose)
    SumByAddBackClose = sum(RiskByAddBackClose)

    return StockWeights([r / SumByAdjClose for r in RiskByAdjClose], [r / SumByAddBackClose for r in RiskByAddBackClose])


def get_return(start_day: str | YearMonth, end_day: str | YearMonth, stock: Stock, debug=True) -> StockReturn:
    # Finding the index of the buy_day and sell_day
    buy_day = str(start_day)
    sell_day = str(end_day)

    buy_index = stock.price['Day'].searchsorted(buy_day)
    sell_index = stock.price['Day'].searchsorted(sell_day) - 1

    if buy_index > sell_index:
        return StockReturn(NaN, NaN)

    buy = stock.price.iloc[buy_index]
    sell = stock.price.iloc[sell_index]
    if debug:
        print(f"# Return by Adj Close BUY: {buy.Day} SELL: {sell.Day}")
        print("buy: {:.6f} sell: {:.6f} gain: {:.6f}\n".format(buy["Adj Close"], sell["Adj Close"],
                                                               sell["Adj Close"] - buy["Adj Close"]))

    ReturnByAdjClose = sell["Adj Close"] / buy["Adj Close"] - 1
    if debug:
        print("return: {:.2f}% ({:.6f})".format(ReturnByAdjClose*100, ReturnByAdjClose))

    dividends = stock.dividend[(stock.dividend.Day > buy_day) & (stock.dividend.Day < sell_day)].Dividends.sum()

    if debug:
        print("Total Dividend: {:.6f}\n".format(dividends))
    ByAddBackClose = (sell["Close"] + dividends) / buy["Close"] - 1

    if debug:
        print("# Actual Return by adding back dividend")
        print("buy: {:.6f} sell: {:.6f} gain: {:.6f}".format(buy["Close"],
                                                             sell["Close"] +
                                                             dividends,
                                                             sell["Close"] + dividends - buy["Close"]))
        print("return: {:.2f}% ({:.6f})".format(ByAddBackClose*100, ByAddBackClose))
        print("")

    r = StockReturn(ReturnByAdjClose, ByAddBackClose)
    if debug:
        print("# Return difference")

    if debug:
        d = get_return_diff(r)
        print("{:.2f}% ({:.6f})".format(d*100, d))

    return r
