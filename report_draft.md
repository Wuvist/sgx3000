Making money in SGX
Everything you need to know

# Abstract

SGX is a security market sometimes infamouse for low liquidity, and investor believe that banking & property are the only sector worth investing in SGX. After analyzing all 767 currently listed stocks on SGX's transaction history up to 2000. and found returns and volatilities of different sectors, especailly S-REITs. A sector mainly relying on dividends for return. Finally, we simulated different several trading strategies

# Introduction about SGX

* How many stocks

# Dividend

How dividend affects return calculation

* DBS example

# Liquidity

See Liquidity trend

# REIT-s

# Portolio

* Weight via
  * Return
  * Risk

Compare return with / without dividend

* rolling back testing


# 2024.Mar After presentation

Trading strategy generation and SG equity market

## naive trading strategy
* Intuitively analyze the SGX market by market cap and P/E ration
* based on sector analysis choose the target sector and industry to invest
* deep analysis in bank (market cap) and real estate sector (market cap, risk diversification)
* according to the criteria of average P/E ration generate naive trading strategy

## data based trading strategy
* 24 years of SGX data
* add dividends back 
* identify each year top 10 return stocks...
* ...
* generating the trading strategy "return chasing"

## Comparison two strategies 
* Back Test two strategies return after 2024-01-01 (short term return)
* compare two strategies' return and the STI return
* Using the DM test to the test the difference in return of two strategy is significant large
* calculate the long term return of two strategies compare performance in different 
* regress the delta of strategies' return on GDP of SG each year to see whether it can explain the performance difference 

## Combine the naive strategy and "return chasing" strategy
The third strategy is weighted (may change the weights) two strategies, and calculate the return
compared with other two strategies, conduct DM test.
