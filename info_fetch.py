import yfinance as yf
import json

tickers = open("ticker2024.txt", "r").readlines()
info = dict()

for ticker in tickers:
    ticker = ticker.strip()
    if ticker == "":
        continue
    t = yf.Ticker(ticker + ".SI")
    try:
        info[ticker] = t.info
    except:
        continue
    print(ticker)


data = {k:info[k] for k in info if len(info[k])>1}
with open('data/info.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, ensure_ascii=False, indent=4)
