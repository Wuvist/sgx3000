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

with open('data/info.json', 'w', encoding='utf-8') as f:
    json.dump(info, f, ensure_ascii=False, indent=4)
