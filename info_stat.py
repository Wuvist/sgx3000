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


# python info_stat.py industry | save industries.json
# python info_stat.py sector | save sectors.json

match cmd:
    case "sector":
        sector()
    case "industry":
        industry()
