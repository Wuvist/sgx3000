import json

with open('data/info.json') as f:
    info = json.load(f)

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
