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


def fetch():
    ticker = sys.argv[2].upper()
    try:
        data = info[ticker]
        data['qoute'] = qt[ticker]
    except KeyError:
        print("{}")
        return

    print(json.dumps(data, ensure_ascii=False, indent=4))

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
