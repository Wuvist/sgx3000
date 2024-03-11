import json
import sys

cmd = sys.argv[1]

info = None
with open('data/info.json') as f:
    info = json.load(f)

def sector():
    sectors = dict()
    for key, v in info.items():
        try:
            sector = v['sector']
        except KeyError:
            sector = "None"
        if sector in sectors:
            sectors[sector] = sectors[sector] + 1
        else:
            sectors[sector] = 1

    print(json.dumps(sectors, ensure_ascii=False, indent=4))

def industry():
    industries = dict()
    for key, v in info.items():
        try:
            industry = v['industry']
        except KeyError:
            industry = "None"
        if industry in industries:
            industries[industry] = industries[industry] + 1
        else:
            industries[industry] = 1

    print(json.dumps(industries, ensure_ascii=False, indent=4))

def count_item_by_key(data, key):
    result = dict()
    for item in data:
        try:
            val = item[key]
        except KeyError:
            val = "None"
        if val in result:
            result[val] = result[val] + 1
        else:
            result[val] = 1

    return result

def industry_in_sector():
    sector = sys.argv[2]
    industries = dict()
    data = [v for key, v in info.items() if 'sector' in v and v['sector'] == sector]
    if sector == "None":
        data = [v for key, v in info.items() if not 'sector' in v]

    print("Sector: " + sector)
    industries =count_item_by_key(data, 'industry')
    industries = dict(sorted(industries.items(), key=lambda x:x[1], reverse=True))

    print(json.dumps(industries, ensure_ascii=False, indent=4))


# python info_stat.py industry | save industries.json
# python info_stat.py sector | save sectors.json

match cmd:
    case "sector":
        sector()
    case "industry":
        industry()
    case "industry_in_sector":
        industry_in_sector()
