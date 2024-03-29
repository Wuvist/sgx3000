import json
import numpy as np

info = None
with open('data/info.json', encoding="utf8") as f:
    info = json.load(f)
    for _, item in info.items():
        if not "sector" in item:
            item["sector"] = "None"

        if not "industry" in item:
            item["industry"] = "None"

qt = None
with open('data/quote_table.json', encoding="utf8") as f:
    qt = json.load(f)


def get_active():
    data = dict()
    for k, v in qt.items():
        if get_avg_vol(k) > 10000:
            data[k] = get_mc(k)
    return data


def get_all_mc():
    '''return all stocks with market cap info available'''

    data = dict()
    for k, v in qt.items():
        mc = get_mc(k)
        if mc != np.nan:
            data[k] = mc
    return data


def get_all_avg_vol():
    '''return all stocks with averge volumn info available'''

    data = dict()
    for k, _ in qt.items():
        vol = get_avg_vol(k)
        if vol != np.nan:
            data[k] = vol
    return data


def get_avg_vol(ticker):
    try:
        v = qt[ticker]
        vol = v["Avg. Volume"] * v["Open"]
        return vol
    except KeyError:
        return np.NaN


def get_mc(ticker):
    try:
        return info[ticker]["marketCap"]
    except KeyError:
        return np.NaN


def get_sectors():
    return count_item_by_key(info, 'sector')


def sector():
    sectors = count_item_by_key(info, 'sector')
    print(json.dumps(sectors, ensure_ascii=False, indent=4))


def industry():
    industries = count_item_by_key(info, 'industry')
    print(json.dumps(industries, ensure_ascii=False, indent=4))


def count_item_by_key(data, key):
    result = dict()
    for _, item in data.items():
        val = item[key]
        if val in result:
            result[val] = result[val] + 1
        else:
            result[val] = 1

    return dict(sorted(result.items(), key=lambda x: x[1], reverse=True))


def industry_in_sector(sector):
    industries = dict()
    data = {key: v for key, v in info.items(
    ) if 'sector' in v and v['sector'] == sector}
    if sector == "None":
        data = {key: v for key, v in info.items() if not 'sector' in v}

    print("Sector: " + sector)
    industries = count_item_by_key(data, 'industry')

    print(json.dumps(industries, ensure_ascii=False, indent=4))


def find_sector(keyword):
    return {key: v for key, v in info.items(
    ) if 'sector' in v and keyword in v['sector'].lower()}


def find_industry(keyword):
    data = {key: v for key, v in info.items(
    ) if 'industry' in v and keyword in v['industry'].lower()}

    print("Industry: " + keyword)
    for key, v in data.items():
        print(key + "\t" + v['industry'])

    return data
