# Adjusted Price Calculation

https://support.stockcharts.com/doku.php?id=policies:adjusted_data


Let's look at this example. A stock closes at $40.00 on Monday. On Tuesday, it begins trading ex-dividend based on a $2.00 dividend. If the stock opens unchanged, it will be trading at $38.00. Unless we adjust the prior prices, the chart will show a misleading $2.00 gap.

To calculate the adjustment factor, we subtract the $2.00 dividend from Monday's closing price ($40.00 - $2.00 = $38.00). Then, we divide 38.00 by 40.00 to determine the dividend adjustment in percentage terms. The result is 0.95.

Lastly, we *multiply* all historical prices prior to the dividend by the factor of 0.95. This adjusts historical prices proportionately so that they stay rationally aligned with current prices.

## From Slides

In most cases it is convenient to choose the adjusted closing price (denoted by Close*) for empirical work.

To smooth out the effect of the dividend, the closing price and all previous prices are scaled by an appropriate adjustment factor.


# DBS

## Dividend

Total of 8 dividends: 3.32

Day,Close,Dividends,Adjustment Factor
2022-04-08,31.4272,0.36,0.9886746866663311
2022-05-11,29.514402,0.36,0.9879495495842896
2022-08-15,30.659035,0.36,0.9883942230955928
2022-11-11,32.861649,0.36,0.9891636926270577
2023-04-10,31.059921,0.5,0.9841571213058486
2023-05-09,30.803185,0.42,0.9865484575004119
2023-08-11,33.133488,0.48,0.9857200181070171
2023-11-14,32.599998,0.48,0.9854897210090522

Total Adjustment Factor: 0.9886746866663311 * 0.9879495495842896 * 0.9883942230955928 * 0.9891636926270577 * 0.9841571213058486 * 0.9865484575004119 * 0.9857200181070171 * 0.9854897210090522 = 0.9006894679417004

Current(2024-04-27) Price: 36.08
Adjusted Price(2022-03-03): 30.075195

Return using normal Adjusted Price:
36.08/30.075195 - 1 = 0.19965971957954043 = 20.0%

But, if we add back the dividend, the original price is:
30.075195 / 0.9006894679417004 = 33.39130307444286

The real return is:
(36.08 + 3.32)/33.39130307444286 - 1 = 0.17994796166418836 = 18.0%

Difference by:
0.19965971957954043/0.17994796166418836 - 1 = 0.10954143482957224 = 11.0%

# D8DU (REITs)

Current(2024-04-27) price: 0.0340
Buy (2022-03-03) adjusted price: 0.048462

Return: -29.8%
0.0340/0.048462 - 1 = -0.2984193801328875

One Dividend: 0.016

Day,Close,Dividends,Adjustment Factor
2022-08-12,0.053846,0.016,0.7709246055608052

Original price: 0.06286217828622367

Real Return: -20.5%
(0.0340 + 0.016)/0.06286217828622367 - 1 = -0.2046091725880017

Difference by: -54.2%
(-0.2984193801328875 - (-0.2046091725880017))/(-0.2046091725880017) - 1 = -0.5415151414849775

# A17U (REITs)
Current(2024-04-27) price: 0.0340
Buy (2022-03-03) adjusted price: 0.048462
