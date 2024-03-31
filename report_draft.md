Making money in SGX
Everything you need to know

# Introduction

Singapore, ranked as the world’s most competitive economy in the world, is recognized as a dynamic global financial hub with estimated total assets of more than SGD$2.4 trillion under management. However, due to the size limitation, the liquidity Singapore equity market is not comparable with other gigantic equity market,such as U.S market. The colliding of Singapore equity market characters increases the complexity of making trading strategies for investors who want to making money in SG. Our team want to analysis Singapore exchange (SGX) for investors' respective, and based on our knowledge acquired we generate some strategies and evaluate these strategies performance.

After investigating the SGX, we summarize the characteristic of SG equity market and the development path in section A. We find that Singapore boasts core sectors in Financial, Consumer, Healthcare, Technology and Commodities & Resources. It also obtains the world's largest Maritime & Offshore services related companies. Beside this prevalent sectors, Singapore Real Estate Investment Trusts (REITs) and Property Trusts sector is a global REIT platform and the second largest REIT market in Asia. More importantly, we find that the SGX offer investors high dividends, and REITs which have less change in price while provide stable dividends can be used as a risk diversification tool. Aiming at investing in high market cap and low P/E ratio stocks, and diversify the risk, we generate our SGX investment trading strategy one and explain in section B.

In section C, we use a more objective perspective view to generate our second trading strategy. We analyze all 767 currently listed stocks on SGX's transaction history up to 2000. By adding back all the dividends back to the stock prices, we re-ranked the return of each stocks and calculate all returns and volatility of different sectors, especially the results of S-REITs, which is a sector mainly relying on dividends for return. By selecting high historical return stocks and weight them by past performance of return and volatility,we generate a return chasing trading strategy.

To precise analyze these two strategies, in Section D, we simulate these two trading strategies in SGX from past 24 years, and calculate the annual returns and analyze the results. After conducting the Diebold-Mariano Test, we compare the difference of performance of our trading strategies. We find that the "return chasing" strategy perform better in ... years while the simple strategy is good at ... situations.

# Section A

## Introduction about SGX

SGX is ASEAN's second largest market capitalization after Indonesia Stock Exchange at US$585.97 billion as of September 2023. Currently, there are _1384_ securities trading on SGX, including 587 stocks, 69 ETFs, and 41 REITs(including 6 business trusts).

_TBD_: 1384 should includes derivatives, which we could ignore?

More than a securities exchange, SGX is a cornerstone of Singapore's financial sector, supporting banking, asset management, and fintech. As a crucial economic pillar, SGX, alongside MAS, ensures strong corporate governance and regulatory standards, safeguarding investors and making the Singapore appealing to global entities. This synergy fosters Singapore's economic stability and growth.

SGX's derivatives market is particularly notable for its diversity, including commodities, currencies, and indices, attracting international traders, currently have 643 companies listed in it. SGX also known for its international appeal, with numerous foreign companies choosing to list there, such as CapitaLand China Trust (CLCT), Hutchison Port Holdings Trust (HPHT), NIO, Prudential PLC, Alita Resource Limited. This not only brings in capital from abroad but also enhances Singapore's status as a global financial center. The presence of international companies contributes to the cross-border flow of funds, investment diversification, and economic resilience.

Nonetheless, the trading volume on SGX, which includes stocks, bonds, derivatives, and other financial instruments, underscores its role in providing liquidity to the market. According to SGX statistic report the securities market turnover volume is 32,838 million shares in February 2024. Compared with the U.S market who has a 234,703 million shares in same time period, the turnover volume is relative small.

## Dividend

Many Singapore-listed companies have a culture of paying regular dividends to shareholders. This is particularly appealing to income-seeking investors who prioritize consistent cash flows. Dividend stocks can provide a steady income stream and potentially outperform during periods of market volatility.

The Straits Times Index (STI) comprises 30 stocks representing the largest and most active publicly listed companies on the SGX. These 30 stocks are considered the main indicators of the Singapore stock market, reflecting the overall performance of the market in Singapore. The top 10 companies are from financial service, Manufacturing, Real estate, consumer goods and services and telecommunications.

To investigating the real example of high dividends, we focus on the three banks: DBS, OCBC and UOB since they occupy 20%, 13% and 11%(44% in total) of the STI.

### SG banks' dividends

Figure one Plotting a line graph of those three banks, showing their yearly dividends.

![Banks analysis](/Banks%201.png "Figure 1 Three top banks dividends")

The dividend yields have fluctuated but show a general increase in more recent years. Each of these three banks has been distributing dividends to its shareholders annually, and calculations show that the average dividend yield over the past 20 years has reached 3.51%. This figure is approximately 1% higher than the interest rate of the Central Provident Fund's (CPF) ordinary account, which has remained at 2.5% over the same period.

### Comparison to Banks in China and US

In comparing the dividend yields of banks from Singapore, China, and the USA, selecting three top market-cap banks from each and averaging their dividend yields over the past two decades, we observe a trend starting from 2010. Chinese banks rank first in dividend yield, followed by Singaporean and then American banks. Singaporean banks show a trend of catching up with Chinese banks in recent years. The average dividend yields over the last 20 years for Chinese, Singaporean, and American banks are approximately 4.49%, 3.51%, and 2.55%, respectively. In a global comparison, Singaporean banks' dividend yields are at a moderate level.

![Banks analysis compare other market](/Banks%202.png "Figure 2 Dividends comparison")

### Volatility Analysis

Analyzing the standard deviations of these three banks, with DBS at 7.97, UOB at 6.58, and OCBC at 3.05, indicates that DBS has the highest volatility, followed by UOB, and OCBC has the lowest. This is also reflected in their stock price movements. Therefore, if you are a risk-averse investor, it's recommended to invest in OCBC. However, if you are willing to take on more risk for the potential of higher returns, DBS could be the better choice for investment.
![Banks analysis volatility](/Banks%203.png "Figure 3 Banking stocks volatility")

# REIT-s

A well-established REIT market is another advantage of SGX. Carrying on with the theme of dividends, Singapore also has a vibrant real estate investment trust (REIT) market which is now the second largest in Asia (after Japan). Specially, one-fifth the stock market of SG is taken by REITs.

![REITs analysis](/REITs%20market%20cap.png "Figure 4 REITs market cap")

Although, the market cap of S-REITs is relative small compared with the U.S REITs market, its volume is considerable in the Pacific region. Calculating at the percentage of the entire stock market, S-REITs shows a large impacts among Australia and Japan.

| Country   | REIT Market Cap(US$BIL) | Percentage |
| --------- | ----------------------- | ---------- |
| Singapore | 74.4                    | 12%        |
| Japan     | 105.8                   | 3.5%       |
| Australia | 83.4                    | 6%         |
| UK        | 59.4                    | 2.2%       |

The function of REITs is similar to stock. They pool the capital of numerous investors. This makes it possible for individual investors to earn dividends from real estate investments without having to buy, manage, or finance any properties themselves. Compared with physical real estate investments, REITs is more accessible and liquid.

Moreover, REITs invest in most real estate property types, including apartment buildings, data centers, hotels, medical facilities, offices, retail centers, and warehouses etc. In other words, REITs is flexible in invest in commercial, public and residential property at same period. In contrast, the physical real estate investments may not achieve this diversification.

## High dividends and low value

By law and IRS regulation, REITs must pay out 90% or more of their taxable profits to shareholders in the form of dividends. As a result, REIT companies are often exempt from most corporate income tax. Hence, REITs provide a high dividend for investors. There are currently 42 REITs and property trusts listed in Singapore. The average dividend yield of S-REITs was 7.6% as of 31 December 2022. This compares favorably with the 10-year Singapore government bond benchmark yield of 3.1% and the CDF ratio of 2.5%.

Forward yield is the percentage of a company's current stock price that it expects to pay out as dividends over 12 months. Based on 15th March 2024 close price calculation, we plot the following stocks' forward dividend yield to verify the yield level of S-REITs.[^1]

![REITs analysis yield](/REITS%20yield.png "Figure 5 REITs yields comparison")

[^1]:
    we use following REITs and stocks:
    REITs( blue points):Sabana REIT (SGX: M1GU)
    An industrial REIT with a portfolio of 18 properties in Singapore covering high-tech industrial, warehouse and logistics, and general industrial sectors.

Keppel Pacific Oak US REIT (SGX: CMOU)
An office REIT with 13 freehold office buildings and business campuses across eight markets in the US.

Frasers Logistics & Commercial Trust (SGX: BUOU)
A diversified portfolio of 108 properties across Singapore, the UK, Australia, the netherlands and Germany.

Mapletree Logistics Trust (SGX: M44U)
An industrial REIT with a portfolio of 187 properties spread across eight countries. The price of these REITs in over one years.

Stocks in other sectors (Non-REITs,red points):
SGX-Singapore Exchange Limited,
Telecommunications - Singapore Telecommunications Limited,
Industrial Goods and shipbuilding - Yangzijiang Shipbuilding (Holdings) Ltd.
Food & Beverage- Wilmar International Limited (5%) Agriculture Golden Agri-Resources Ltd
Transportation-Singapore Airlines Limited
Utilities-Sembcorp Industries Ltd
Services-United Overseas Insurance Limited

Real-estate Stocks(Orange points):
Keppel Ltd.
CapitaLand Investment Limited
City Developments Limited

We can observe that the majority of REITs stands higher than the 5% yield rate line which indicating that these type of assets provider a relative higher dividends to investors. Unfortunately, these blue points also falls in the left corner, where is low value stocks.

The reason behind the character of high dividends and low price is the nature of REITs. The contractual nature of commercial real estate leases and the predictability of rental income and expenses, give REITs a defensive quality.

REITs allowing analysts to more accurately forecast earnings, which helps reduce share price volatility.
According to 15th March 2024 stock price, we tabulate the daily range and one year range of four S-REITs of above analysis.

| REITs                                            | Daily range     | spread | 52-week range   | spread |
| ------------------------------------------------ | --------------- | ------ | --------------- | ------ |
| Sabana REIT (SGX: M1GU)                          | 0.3600 - 0.3650 | -0.005 | 0.3550 - 0.4900 | -0.135 |
| Keppel Pacific Oak US REIT (SGX: CMOU)           | 0.1260 - 0.1350 | -0.009 | 0.1230 - 0.4450 | -0.322 |
| Frasers Logistics & Commercial Trust (SGX: BUOU) | 1.0200 - 1.0400 | -0.02  | 1.0200 - 1.0400 | -0.36  |
| Mapletree Logistics Trust (SGX: M44U)            | 1.4300 - 1.4600 | -0.03  | 1.4300 - 1.8000 | -0.37  |

In contrast with other stocks, the daily range of REITs is very limited, even the 52 weeks range is not large.

## Exposure to global real estate

To investigate the risk defensive quality of REITs, we analyze the risk exposure by this asset.
REITs focus on the real estate market. Singapore is a small city-state with a finite land area. With a dense population and limited land, there is high demand for housing, both for residential and commercial purposes. Within Singapore real estate market the risk are measurable and easily control.

Moreover, besides espousing to Singapore real estate, over 90% of S-REITS own properties outside Singapore. This gives S-REITs access to growing Asian and global markets, while giving investors risk diversification opportunities by holding REITS.

For analysis, in this sub section, we use CSOP iEdge S-REIT Leaders Index ETF (SRU.SI) as a proxy for S-REITs and SG real estate market.

Top 7 Holdings of CSOP iEdge S-REIT Leaders Index ETF are list in below table. These REITs are comprise 55.04% of total assets in this ETF.

| REITs                                  | %Assets |
| -------------------------------------- | ------- |
| CapitaLand Integrated Commercial Trust | 10.67%  |
| Mapletree Logistics Trust              | 9.17%   |
| Mapletree Industrial Trust             | 8.67%   |
| Frasers Logistics & Commercial Trust   | 7.39%   |
| Keppel REIT                            | 6.84%   |
| Keppel DC REIT                         | 6.34%   |
| Frasers Centrepoint Trust              | 5.98%   |

### Singapore market risk

By regressing the past one year historical adjust close price of S-REITs ETF on the STI, we have a general view of the risk in SG market. Following is the results:

# OLS Regression Results

Dep. Variable: SRU.SI_log_return R-squared: 0.003
Model: OLS Adj. R-squared: -0.001
Method: Least Squares F-statistic: 0.7061
Date: Sat, 16 Mar 2024 Prob (F-statistic): 0.402
Time: 20:43:38 Log-Likelihood: 668.64
No. Observations: 227 AIC: -1333.
Df Residuals: 225 BIC: -1326.
Df Model: 1
Covariance Type: nonrobust
==================================================================================
coef std err t P>|t| [0.025 0.975]

---

const 0.0001 0.001 0.148 0.883 -0.002 0.002
STI_log_return -0.0219 0.026 -0.840 0.402 -0.073 0.029
==============================================================================
Omnibus: 86.636 Durbin-Watson: 1.876
Prob(Omnibus): 0.000 Jarque-Bera (JB): 1913.019
Skew: 0.884 Prob(JB): 0.00
Kurtosis: 17.111 Cond. No. 30.7
================================================================================

Under OLS method, the coefficient is not statistical significant, which suggests that the systematic risk of S-REITs is less relate to the Singapore market risk. Investors can consider S-REITs as a tool to against the market risk.

### Global market risk

As the nature of S-REITs which invest property globally, we calculate the correlation matrix of S-REITs and other market financial assets in short term.

Based on the historical adjust price 1st February to the middle of March, we compute the correlation of S-REITs and following assets:

(1)S REITs: CSOP iEdge S-REIT Leaders Index ETF (SRU.SI)
(2)Asia ex Japan REITs: NikkoAM-StraitsTrading Asia ex Japan REIT ETF (CFA.SI)
(3)US Bonds: iShares J.P. Morgan USD Asia Credit Bond Index ETF (N6M.SI)
(4)US Equities (S&P 500 Index):S&P 500 (^GSPC)
(5)US REITs: Prime US REIT (OXMU.SI)
(6)Global REIT: iShares Global REIT ETF (REET)

|         | SRU.SI | CFA.SI | N6M.SI | ^GSPC | OXMU.SI | REET |
| ------- | ------ | ------ | ------ | ----- | ------- | ---- |
| SRU.SI  | 1.00   | 0.36   | 0.08   | 0.13  | 0.59    | 0.35 |
| CFA.SI  | 0.36   | 1.00   | -0.29  | 0.32  | -0.06   | 0.02 |
| N6M.SI  | 0.08   | -0.29  | 1.00   | -0.43 | 0.26    | 0.01 |
| ^GSPC   | 0.13   | 0.32   | -0.43  | 1.00  | -0.05   | 0.32 |
| OXMU.SI | 0.59   | -0.06  | 0.26   | -0.05 | 1.00    | 0.25 |
| REET    | 0.35   | 0.02   | 0.01   | 0.32  | 0.25    | 1.00 |

The highest correlation is 0.59 existing between the S-REITs and U.S REIT. That is consistent with our expectation, because that S-REITs own large share of American properties. For investors hold S-REITs can be a indirect way to invest in American real estate market, and the risk may be dilute since the correlation is positive but less than one.

## Diversification tool

We conduct a empirical investing portfolio to verify the efficient of S-REITS in diversification of risk.

First, we generate following portfolios,using following three assets:
Market index: S&P 500 (^GSPC)
Bonds: iShares 0-5 Year TIPS Bond ETF (STIP)
REITs: CSOP iEdge S-REIT Leaders Index ETF (SRU.SI)

Portfolio:
(1) 55% Market index funds + 35% Bonds + 10% REITs
(2) 40% Market index funds + 40% Bonds + 20% REITs
(3) 33.3% Market index funds + 33.3% Bonds + 33.3% REITs
(4) 60% Market index funds + 40% Bonds
(5) 80% Market index funds + 20% Bonds

Based on the historical price from 1st January 2023 to 1st January 2024, we calculate the annual return and standard deviation of each portfolio. Plotting these five portfolio in figure 6.

![REITs analysis portfolio](/Portfolio%20analysis.png "Figure 6 Five portfolio return vs. standard deviation")

With the weight of S-REITs increase, the annual return is decreasing. This is not surprisingly, because the S-REITs ETF only own -15% for 5 years return, while the S&P 500 achieve 12% 5 years return. The more S-REITs you hold in portfolio the lower return investors get. However, our portfolio is generated by analysis purpose, the share of S-REITS is exaggerated.

It is worth to note that the portfolio 1 and portfolio 4 obtains similar annual return, while the standard deviation is different. For further analysis, we calculate the Sharpe ratio for these portfolios. As for risk free rate, we introduce the CDF interest rate 2.5%.

| No.         | Component                                            | Sharpe ration | Rank |
| ----------- | ---------------------------------------------------- | ------------- | ---- |
| Portfolio 1 | 55% Market index funds + 35% Bonds + 10% REITs       | 1.07          | 2    |
| Portfolio 2 | 40% Market index funds + 40% Bonds + 20% REITs       | 0.86          | 5    |
| Portfolio 3 | 33.3% Market index funds + 33.3% Bonds + 33.3% REITs | 0.87          | 4    |
| Portfolio 4 | 60% Market index funds + 40% Bonds                   | 1.03          | 3    |
| Portfolio 5 | 80% Market index funds + 20% Bonds                   | 1.39          | 1    |

Considering the balance of risk and returns of these portfolios, the portfolio 1 sightly beats portfolio 4. This reversal suggests that including S-REITs can efficient diversify risk for a high volatilized portfolio.

# Liquidity

See Liquidity trend

# Section B

## Trading strategy one

### Sector select and portfolio generation

# Section C

## Dividends add back

## Trading strategy two

Portfolio

- Weight via
  - Return
  - Risk

Compare return with / without dividend

- rolling back testing

# Section D

## Comparison two strategies

- Back Test two strategies return after 2024-01-01 (short term return)
- compare two strategies' return and the STI return
- Using the DM test to the test the difference in return of two strategy is significant large
- calculate the long term return of two strategies compare performance in different
- regress the delta of strategies' return on GDP of SG each year to see whether it can explain the performance difference

## Combine the naive strategy and "return chasing" strategy

The third strategy is weighted (may change the weights) two strategies, and calculate the return
compared with other two strategies, conduct DM test.
