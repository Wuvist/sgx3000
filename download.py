import yfinance as yf

# data = yf.download("1A0.SI", start="2000-01-01", end="2024-01-31")
# data.to_csv("t.csv",  float_format='%.6f')

tickers = open("../ticker2024.txt", "r").readlines()

for ticker in tickers:
	ticker = ticker.strip()
	if ticker == "":
		continue
	data = yf.download(ticker + ".SI", start="2000-01-01", end="2024-01-31")
	data.to_csv(ticker + ".csv",  float_format='%.6f')
	print(ticker + " done")
