import yahoo_fin.stock_info as si
import json

with open('data/info.json') as f:
    info = json.load(f)

data = dict()
for ticker in info:
    try:
        data[ticker] = si.get_quote_table(ticker + ".SI")
    except ValueError:
        data[ticker] = dict(err="value")
    except IndexError:
        data[ticker] = dict(err="index")
    except KeyError:
        data[ticker] = dict(err="key")

with open('data/quote_table.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, ensure_ascii=False, indent=4)
