# Adjusted Price Calculation

https://support.stockcharts.com/doku.php?id=policies:adjusted_data

Let's look at this example. A stock closes at $40.00 on Monday. On Tuesday, it begins trading ex-dividend based on a $2.00 dividend. If the stock opens unchanged, it will be trading at $38.00. Unless we adjust the prior prices, the chart will show a misleading $2.00 gap.

To calculate the adjustment factor, we subtract the $2.00 dividend from Monday's closing price ($40.00 - $2.00 = $38.00). Then, we divide 38.00 by 40.00 to determine the dividend adjustment in percentage terms. The result is 0.95.

Lastly, we _multiply_ all historical prices prior to the dividend by the factor of 0.95. This adjusts historical prices proportionately so that they stay rationally aligned with current prices.

## From Slides

In most cases it is convenient to choose the adjusted closing price (denoted by Close) for empirical work.

To smooth out the effect of the dividend, the closing price and all previous prices are scaled by an appropriate adjustment factor.

# DBS

## Dividend

Total of 8 dividends: 3.32

```
Day,Close,Original Close,Dividends,Adjustment Factor
2023-11-14,32.599998,32.599998,0.48,0.9854897210090522
2023-08-11,33.133488,33.62134306796656,0.48,0.9859243080531075
2023-05-09,30.803185,31.702970096931587,0.42,0.9869252438758731
2023-04-10,31.059921,32.390706139513085,0.5,0.984798137264699
2022-11-11,32.861649,34.798634565710074,0.36,0.9897606945079971
2022-08-15,30.659035,32.802060776144096,0.36,0.9891442210895719
2022-05-11,29.514402,31.923979110743335,0.36,0.9888489582165476
2022-04-08,31.4272,34.37627055120931,0.36,0.9896361931120592

Total Adjustment Factor: 0.9854897210090522 * 0.9859243080531075 * 0.9869252438758731 * 0.984798137264699 * 0.9897606945079971 * 0.9891442210895719 * 0.9888489582165476 * 0.9896361931120592 = 0.9047373106352632

Current(2024-04-27) Price: 36.08
Adjusted Price(2022-03-03): 30.075195

Return using normal Adjusted Price:
36.08/30.075195 - 1 = 0.19965971957954043 = 20.0%

But, if we add back the dividend, the original price is: 33.23

The real return is:
(36.08 + 3.32)/33.23 - 1 = 0.18567559434246173 = 18.6%

Difference by:
0.19965971957954043/0.18567559434246173 - 1 = 0.07531482684410462 = 7.53%
```

# D8DU (REITs)

Buy at 2022-03-03:
Original Close: 0.077000
Adjusted Close: 0.048462

Current(2024-03-15) price: 0.032

## Two Dividend Issued

Day,Close,Original Close,Dividends,Adjustment Factor
2024-02-15,0.045,0.045,0.015,0.75
2022-08-12,0.053846,0.07179466666666666,0.016,0.8177565835434195

Return using Adjusted Close: -34.0%
0.032/0.048462 - 1 = -0.33968882836036474

Return using dividend add back: -18.2%
(0.032 + 0.016 + 0.015)/0.077000 - 1 = -0.18181818181818177

Difference in return: 86.8%
(-0.33968882836036474)/(-0.18181818181818177) - 1 = 0.8682885559820066

# C38U (REITs)

Current(2024-04-27) price: 0.0340
Buy (2023-103-03) adjusted price: 0.048462

Return: -29.8%
0.0340/0.048462 - 1 = -0.2984193801328875

## Dividend

```
Day,Close,Original Close,Dividends,Adjustment Factor
2023-08-07,2.677179,2.677179,0.01578,0.994140274694119
2023-05-23,2.671326,2.6870715008723733,0.06141,0.9776567533816369
2023-02-09,2.660282,2.7371185187070988,0.07925,0.9718609267666501
2022-08-10,2.698085,2.856389531183477,0.07873,0.97317656089861

Total Dividend:
0.01578 + 0.06141 + 0.07925 + 0.07873 = 0.23517

Total Adjustment Factor: 0.994140274694119 * 0.9776567533816369 * 0.9718609267666501 * 0.97317656089861 = 0.9192419495474851

Original price:
0.048462 / 0.9192419495474851 = 0.05271952615288757
```

## Return Compare

Real Return: -20.5%
(0.0340 + 0.016)/0.06286217828622367 - 1 = -0.2046091725880017

Difference by: -54.2%
(-0.2984193801328875 - (-0.2046091725880017))/(-0.2046091725880017) - 1 = -0.5415151414849775

# Y92 / NC2

Adjusted Close is zero
