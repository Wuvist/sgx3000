import pandas as pd
import sys
from io import StringIO
from pysgx import stocks, info

cmd = sys.argv[1]


def industry_in_sector():
    sector = sys.argv[2]
    info.industry_in_sector(sector)


def find_sector():
    keyword = sys.argv[2].lower()
    data = info.find_sector(keyword)

    print("sector: " + keyword)
    print()
    for key, v in data.items():
        print(key + "\t" + v['sector'])


def find_industry():
    keyword = sys.argv[2].lower()
    info.find_industry(keyword)


def cal_dividend():
    day = sys.argv[2].upper()
    ticker = sys.argv[3].upper()

    stock = stocks.load(ticker)

    print(stocks.list_dividend(day, stock))


def cal_return():
    buy_day = sys.argv[2].upper()
    sell_day = sys.argv[3].upper()
    ticker = sys.argv[4].upper()

    s = stocks.load(ticker)

    stocks.get_return(buy_day, sell_day, s)

# python info_stat.py industry | save industries.json
# python info_stat.py sector | save sectors.json


"""
python info_stat.py industry | save -f industries.json
python info_stat.py sector | save -f sectors.json

python info_stat.py cal_dividend 2022-03-03 d8du
python info_stat.py cal_return 2022-03-03 2024-03-15 d8du
"""

match cmd:
    case "sector":
        info.sector()
    case "industry":
        info.industry()
    case "industry_in_sector":
        industry_in_sector()
    case "find_sector":
        find_sector()
    case "find_industry":
        find_industry()
    case "cal_return":
        cal_return()
    case "cal_dividend":
        cal_dividend()
