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

Buy (2023-03-03) adjusted price: 0.048462
Current(2024-04-27) price: 0.0340

Return: -29.8%
0.0340/0.048462 - 1 = -0.2984193801328875

## Dividend

```
Day,Close,Original Close,Dividends,Adjustment Factor
2024-02-14,1.91,1.91,0.0545,0.9722575719012472
2023-08-08,1.886869,1.9407089793193715,0.053,0.9734163809513997
2023-02-08,1.922083,2.030916897832926,0.0536,0.9742866080597751
2022-08-04,2.020652,2.191415895484169,0.0522,0.9767339854807299

Total Dividend:
0.01578 + 0.06141 + 0.07925 + 0.07873 = 0.23517

Total Adjustment Factor: 0.994140274694119 * 0.9776567533816369 * 0.9718609267666501 * 0.97317656089861 = 0.9192419495474851

Original price:
0.048462 / 0.9192419495474851 = 0.05271952615288757
```

## Return by Adj Close BUY: 2022-03-03 SELL: 2024-03-15
buy: 1.918871 sell: 1.920000 gain: 0.001129

return: 0.06% (0.000588)
Total Dividend: 0.213300

## Actual Return by adding back dividend
buy: 2.130000 sell: 2.133300 gain: 0.003300
return: 0.15% (0.001549)

## Return difference
-62.02% (-0.620236)

# Y92 / NC2

Adjusted Close is zero

Y92

```csv
Date,Open,High,Low,Close,Adj Close,Volume
2006-05-30,0.280000,0.280000,0.260000,0.270000,0.000000,316209000
2006-05-31,0.260000,0.265000,0.255000,0.260000,0.000000,154859
2006-06-01,0.270000,0.270000,0.260000,0.260000,0.000000,72665
```

# T14

Adjusted Close is negative

```csv
Date,Open,High,Low,Close,Adj Close,Volume
2001-06-01,0.387500,0.412500,0.387500,0.412500,-0.000011,68552000
2001-06-04,0.425000,0.535000,0.425000,0.530000,-0.000014,160426000
2001-06-05,0.540000,0.550000,0.432500,0.447500,-0.000012,134070000
```

# Strategy using AddBack Close

```
AddBack Close Return: 3.07166240833986
Adj Close Return    : 6.466738845153519
```

# Strategy using Adj Close

```
AddBack Close Return: 1.8382072607663853
Adj Close Return    : 98.17057979089792
```

# Yield

```
2000-01-01 :  109   0.047040682895506294
2001-01-01 :  124   0.06357748477897936
2002-01-01 :  114   0.05655976607323115
2003-01-01 :  132   0.05138115624439527
2004-01-01 :  145   0.051459969970127625
2005-01-01 :  172   0.0724260613838125
2006-01-01 :  202   0.061370292063319586
2007-01-01 :  225   0.05993048506935729
2008-01-01 :  249   0.11842908787730255
2009-01-01 :  225   0.061051344779131975
2010-01-01 :  253   0.06526285336138526
2011-01-01 :  287   0.09221663132394683
2012-01-01 :  288   0.06942911037241112
2013-01-01 :  308   0.06373178925316576
2014-01-01 :  320   0.09257821969571672
2015-01-01 :  304   0.06790733199557104
2016-01-01 :  294   0.08978533747252226
2017-01-01 :  297   0.06304922512826906
2018-01-01 :  321   0.07262295335139904
2019-01-01 :  307   0.07756952077879974
2020-01-01 :  303   0.08269244711683504
2021-01-01 :  308   0.13286366346367773
2022-01-01 :  197   0.10787902286600858
2023-01-01 :  172   0.06832384807589578
0.07454742855794864
```

all stock; with dividend
708 542

In most cases it is convenient to choose the adjusted closing price (denoted by Close\*) for empirical work.

These adjustments mean that the historical prices do not necessarily reflect the actual prices at which trades took place.
