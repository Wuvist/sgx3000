import pandas as pd
import json
import sys

cmd = sys.argv[1]

info = None
with open('data/info.json', encoding="utf8") as f:
    info = json.load(f)

qt = None
with open('data/quote_table.json', encoding="utf8") as f:
    qt = json.load(f)


def sector():
    sectors = count_item_by_key(info, 'sector')
    print(json.dumps(sectors, ensure_ascii=False, indent=4))


def industry():
    industries = count_item_by_key(info, 'industry')
    print(json.dumps(industries, ensure_ascii=False, indent=4))


def count_item_by_key(data, key):
    result = dict()
    for _, item in data.items():
        try:
            val = item[key]
        except KeyError:
            val = "None"
        if val in result:
            result[val] = result[val] + 1
        else:
            result[val] = 1

    return dict(sorted(result.items(), key=lambda x: x[1], reverse=True))


def industry_in_sector():
    sector = sys.argv[2]
    industries = dict()
    data = {key: v for key, v in info.items(
    ) if 'sector' in v and v['sector'] == sector}
    if sector == "None":
        data = {key: v for key, v in info.items() if not 'sector' in v}

    print("Sector: " + sector)
    industries = count_item_by_key(data, 'industry')

    print(json.dumps(industries, ensure_ascii=False, indent=4))


def find_sector():
    keyword = sys.argv[2].lower()
    industry = dict()
    data = {key: v for key, v in info.items(
    ) if 'sector' in v and keyword in v['sector'].lower()}

    print("sector: " + keyword)
    for key, v in data.items():
        print(key + "\t" + v['sector'])


def find_industry():
    keyword = sys.argv[2].lower()
    industry = dict()
    data = {key: v for key, v in info.items(
    ) if 'industry' in v and keyword in v['industry'].lower()}

    print("Industry: " + keyword)
    for key, v in data.items():
        print(key + "\t" + v['industry'])


def fetch():
    ticker = sys.argv[2].upper()
    try:
        data = info[ticker]
        data['qoute'] = qt[ticker]
    except KeyError:
        print("{}")
        return

    print(json.dumps(data, ensure_ascii=False, indent=4))

    fname = "data/" + ticker + ".csv"
    try:
        df = pd.read_csv(fname)
    except FileNotFoundError:
        print(ticker + " no transaction history")
        return

    dividends = df[df.Dividends >0]

    if len(dividends) == 0:
        print("No dividen given")
        return

    dividends.reset_index(drop=True, inplace=True)
    dividends = dividends.drop('Stock Splits', axis=1)
    for i in range(0, len(dividends)):
        row = dividends.iloc[i]
        dividends.at[i, "Date"] = row.Date[0:10]

    print(dividends.to_string(index=False))


def cal_rclose_one(ticker):
    fname = "data/" + ticker + ".csv"
    df = pd.read_csv(fname)
    size = len(df)

    delta = 0
    df['RClose'] = df.Close
    last_dividend = 0

    for i in range(0, size):
        row = df.iloc[i]

        if row.Dividends > 0:
            gap = row.Dividends / (i - last_dividend)
            for j in range(last_dividend + 1, i):
                df.at[j, "RClose"] = df.iloc[j].RClose + gap*(j - last_dividend) + delta
            df.at[i, "RClose"] = row.RClose + row.Dividends + delta

            delta += row.Dividends
            last_dividend = i

    if delta > 0:
        for i in range(last_dividend + 1, size):
            df.at[i, "RClose"] = df.iloc[i].RClose + delta

    df.to_csv(fname, index=False, float_format='%.6f')


def cal_rclose():
    for ticker, _ in info.items():
        try:
            cal_rclose_one(ticker)
            print(ticker)
        except FileNotFoundError:
            print(ticker + " not found")


# python info_stat.py industry | save industries.json
# python info_stat.py sector | save sectors.json


"""
python info_stat.py industry | save -f industries.json
python info_stat.py sector | save -f sectors.json
python info_stat.py fetch d05 | save -f D05.json
python info_stat.py fetch c76 | save -f C76.json
"""

match cmd:
    case "sector":
        sector()
    case "industry":
        industry()
    case "industry_in_sector":
        industry_in_sector()
    case "fetch":
        fetch()
    case "find_sector":
        find_sector()
    case "find_industry":
        find_industry()
    case "cal_rclose":
        cal_rclose()