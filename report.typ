#import "paper_template.typ": paper
#import "@preview/tablem:0.1.0": tablem
#import "@preview/tablex:0.0.8": tablex, colspanx, rowspanx, hlinex
#import "@preview/wordometer:0.1.1": word-count, total-words

#show: word-count.with(exclude: (heading.where(level: 1), raw.where(block: true)))

#let three-line-table = tablem.with(
  render: (columns: auto, ..args) => {
    tablex(
      columns: columns,
      auto-lines: false,
      align: center + horizon,
      hlinex(y: 0),
      hlinex(y: 1),
      ..args,
      hlinex(),
    )
  }
)

#let line-table = tablem.with(
  render: (columns: auto, ..args) => {
    tablex(
      columns: columns,
      auto-lines: false,
      align: left + horizon,
      hlinex(y: 0),
      hlinex(y: 1),
      ..args,
      hlinex(),
    )
  }
)

#set quote(block: true)

#show: doc => paper(
  title: [Making money in SGX Everything you need to know],
  authors: (
    (
      name: "Cao Danyang",
      affiliation: "",
      email: "",
      note: "Singapore Management University, danyang.cao.2022@mse.smu.edu.sg",
    ),
    (
      name: "Weng Wei",
      affiliation: "",
      email: "",
      note: "Singapore Management University, wei.weng.2022@mse.smu.edu.sg",
    ),
    (
      name: "Luo Hao",
      affiliation: "",
      email: "",
      note: "Singapore Management University, hao.luo.2022@msfe.smu.edu.sg",
    ),
    (
      name: "Liu Qinglin",
      affiliation: "",
      email: "",
      note: "Singapore Management University, qinglin.liu.2022@msfe.smu.edu.sg",
    ),
    (
      name: "Ma Tianqi",
      affiliation: "",
      email: "",
      note: "Singapore Management University, tianqi.ma.2023@msfe.smu.edu.sg",
    ),
  ),
  date: "April 2024",
  abstract: [This paper presents a thorough quantitative analysis of the Singapore Exchange (SGX), highlighting its unique position within global financial markets and its potential as a fertile ground for diverse investment strategies. Through a detailed examination of the SGX's market characteristics, including its size, liquidity constraints, and the significant role of dividends and REITs, we identify unique opportunities and challenges for investors. Our investigation extends to the formulation and evaluation of two novel investment strategies: the Dividend Add-Back Approach and the Return Chasing Trading Strategy (RCTS), which are rigorously compared using the Diebold-Mariano test over different economic conditions. Additionally, we delve into the impact of dividends on market performance indices and propose a methodological refinement to account for dividends in investment returns, challenging the conventional reliance on adjusted close prices. Our findings not only contribute to the existing body of financial econometric literature by offering new insights into the SGX and its investment prospects but also provide practical guidance for investors seeking to navigate this unique market. The study underscores the importance of considering dividend policies and market capitalization in developing robust investment strategies and offers a compelling case for the inclusion of SGX in diversified investment portfolios.],
  keywords: [
    Singapore Exchange (SGX) Analysis, Investment Strategy Evaluation, Quantitative Finance, Real Estate Investment Trusts (REITs) Performance, Add-Back Dividend Methodology],
  acknowledgments: "This paper is a work in progress.",
  doc,
)

#set par(
  leading: 1.2em,
  first-line-indent: 2em,
  justify: true,
)

= Introduction

Singapore, ranked as the world’s most competitive economy in the world, is recognized as a dynamic global financial hub with estimated total assets of more than SGD\$2.4 trillion under management. However, due to the size limitation, the liquidity Singapore stock market is not comparable with other gigantic equity market, such as U.S market. The colliding of Singapore equity market characters increases the complexity of making trading strategies for investors who want to making money in SG. Our team want to analysis Singapore Exchange (SGX) from investors' respective, and based on our knowledge acquired, we generate some strategies and evaluate these strategies performance.

After investigating the SGX, we summarize the characteristic of SG equity market and the development path in @overview. We find that Singapore boasts core sectors in Financial, Consumer, Healthcare, Technology and Commodities & Resources. It also obtains the world's largest Maritime & Offshore services related companies. Beside this prevalent sectors, Singapore Real Estate Investment Trusts (REITs) and Property Trusts sector is a global REIT platform and the second largest REIT market in Asia. More importantly, we find that the SGX offer investors high dividends, and REITs which have less fluctuations in price while provide stable dividends can be used as a risk diversification tool. Aiming at investing in high market cap and low P/E ratio stocks, and diversify the risk, we generate our SGX investment trading strategy one and this strategy is explained in @trading_strategy.

In @rcts, we use a more objective perspective view to generate our second trading strategy. We analyze all 767 currently listed stocks on SGX's transaction history up to 2000. By adding back all the dividends back to the stock prices, we re-ranked the return of each stocks and calculate all returns and volatility of different sectors, especially the results of S-REITs, which is a sector mainly relying on dividends for return. By selecting high historical return stocks and weight them by past performance of return and volatility, we generate a return chasing trading strategy (RCTS).

To precise analyze these two strategies, in @dm_test, we simulate these two trading strategies in SGX from past 24 years, and calculate the annual returns and analyze the results. After conducting the Diebold-Mariano Test, we compare the difference of performance of our trading strategies. We find that the simple "vale growth" investing strategy is possible to approach to RCTS when situation of economic development is good.


= Overview of SGX<overview>

SGX is Asian second largest market capitalization after Indonesia Stock Exchange at US\$585.97 billion as of September 2023. Currently, there are 587 stocks, 69 ETFs, and 41 REITs(including 6 business trusts) trading on SGX.

More than a securities exchange, SGX is a cornerstone of Singapore's financial sector, supporting banking, asset management, and fintech. As a crucial economic pillar, SGX, alongside MAS, ensures strong corporate governance and regulatory standards, safeguarding investors and making the Singapore appealing to global entities. This synergy fosters Singapore's economic stability and growth.

SGX's derivatives market is particularly notable for its diversity, including commodities, currencies, and indices, attracting international traders, currently have 643 companies listed in it. SGX also known for its international appeal, with numerous foreign companies choosing to list there, such as CapitaLand China Trust (CLCT), Hutchison Port Holdings Trust (HPHT), NIO, Prudential PLC, Alita Resource Limited. This not only brings in capital from abroad but also enhances Singapore's status as a global financial center. The presence of international companies contributes to the cross-border flow of funds, investment diversification, and economic resilience.

Nonetheless, the trading volume on SGX, which includes stocks, bonds, derivatives, and other financial instruments, underscores its role in providing liquidity to the market. According to SGX statistic report the securities market turnover volume is 32,838 million shares in February 2024. Compared with the U.S market who has a 234,703 million shares in same time period, the turnover volume of SGX is relative small.

= Dividend Yield in SGX

Many Singapore-listed companies have a culture of paying regular dividends to shareholders. This is particularly appealing to income-seeking investors who prioritize consistent cash flows. Dividend stocks can provide a steady income stream and potentially outperform during periods of market volatility.

The Straits Times Index (STI) comprises 30 stocks representing the largest and most active publicly listed companies on the SGX. These 30 stocks are considered the main indicators of the Singapore stock market, reflecting the overall performance of the market in Singapore. The top 10 companies are from financial service, Manufacturing, Real estate, consumer goods and services and telecommunications.

To investigating the real example of high dividends, we focus on the three banks: DBS, OCBC and UOB since they occupy 20%, 13% and 11%(44% in total) of the STI.

== SG banks' dividends

Figure one Plotting a line graph of those three banks, showing their yearly dividends.

#figure(
  image("Banks 1.png", width: 90%),
  caption: "Three top banks dividends"
) <banks_analysis>

The dividend yields have fluctuated but show a general increase in more recent years. Each of these three banks has been distributing dividends to its shareholders annually, and calculations show that the average dividend yield over the past 20 years has reached 3.51%. This figure is approximately 1% higher than the interest rate of the Central Provident Fund's (CPF) ordinary account, which has remained at 2.5% over the same period.

== Comparison to Banks in China and US

In comparing the dividend yields of banks from Singapore, China, and the USA, selecting three top market-cap banks from each and averaging their dividend yields over the past two decades, we observe a trend starting from 2010. Chinese banks rank first in dividend yield, followed by Singaporean and then American banks. Singaporean banks show a trend of catching up with Chinese banks in recent years. The average dividend yields over the last 20 years for Chinese, Singaporean, and American banks are approximately 4.49%, 3.51%, and 2.55%, respectively. In a global comparison, Singaporean banks' dividend yields are at a moderate level.

#figure(
  image("Banks 2.png", width: 90%),
  caption: "Dividends comparison with other market"
) <banks_analysis_compare_other_market>

== Volatility Analysis

Analyzing the standard deviations of these three banks, with DBS at 7.97, UOB at 6.58, and OCBC at 3.05, indicates that DBS has the highest volatility, followed by UOB, and OCBC has the lowest. This is also reflected in their stock price movements. Therefore, if you are a risk-averse investor, it's recommended to invest in OCBC. However, if you are willing to take on more risk for the potential of higher returns, DBS could be the better choice for investment.

#figure(
  image("Banks 2.png", width: 90%),
  caption: "Banking stocks volatility"
) <banks_analysis_volatility>

This section we focused merely on dividend return of SG banks and its comparison to top banks in China and US. The return gaining from stock itself is ignore. We will analysis this more in @addback.

= REIT-s in SGX

A well-established REIT market is another advantage of SGX. Carrying on with the theme of dividends, Singapore also has a vibrant real estate investment trust (REIT) market which is now the second largest in Asia (after Japan). Specially, one-fifth the stock market of SG is taken by REITs.

#figure(
  image("Banks 2.png", width: 90%),
  caption: "REITs market cap"
) <REITs_analysis>

Although, the market cap of S-REITs is relative small compared with the U.S REITs market, its volume is considerable in the Pacific region. Calculating at the percentage of the entire stock market, S-REITs shows a large impacts among Australia and Japan.

#figure(
  three-line-table[
    | *Country*   | *REIT Market Cap(US\$BIL)* | *Percentage* |
    | --------- | ----------------------- | ---------- |
    | Singapore | 74.4                    | 12%        |
    | Japan     | 105.8                   | 3.5%       |
    | Australia | 83.4                    | 6%         |
    | UK        | 59.4                    | 2.2%       |
  ],
  kind: table,
  caption: "REIT Markets in different countries "
) <REIT_Markets>

The function of REITs is similar to stock. They pool the capital of numerous investors. This makes it possible for individual investors to earn dividends from real estate investments without having to buy, manage, or finance any properties themselves. Compared with physical real estate investments, REITs is more accessible and liquid.

Moreover, REITs invest in most real estate property types, including apartment buildings, data centers, hotels, medical facilities, offices, retail centers, and warehouses etc. In other words, REITs is flexible in invest in commercial, public and residential property at same period. In contrast, the physical real estate investments may not achieve this diversification.

== High dividends and low value

By law and IRS regulation, REITs must pay out 90% or more of their taxable profits to shareholders in the form of dividends. As a result, REIT companies are often exempt from most corporate income tax. Hence, REITs provide a high dividend for investors. There are currently 42 REITs and property trusts listed in Singapore. The average dividend yield of S-REITs was 7.6% as of 31 December 2022. This compares favorably with the 10-year Singapore government bond benchmark yield of 3.1% and the CDF ratio of 2.5%.

Forward yield is the percentage of a company's current stock price that it expects to pay out as dividends over 12 months. Based on 15th March 2024 close price calculation, we plot the following stocks' forward dividend yield to verify the yield level of S-REITs.

#figure(
  image("REITS yield.png", width: 90%),
  caption: "REITs yields comparison"
) <REITs_analysis_yield>

In @REITs_analysis_yield, we use following REITs and stocks:
-  (1) REITs( blue points):
  - Sabana REIT (SGX: M1GU)

    An industrial REIT with a portfolio of 18 properties in Singapore covering high-tech industrial, warehouse and logistics, and general industrial sectors.
  - Keppel Pacific Oak US REIT (SGX: CMOU)

    An office REIT with 13 freehold office buildings and business campuses across eight markets in the US.
  - Frasers Logistics & Commercial Trust (SGX: BUOU)

    A diversified portfolio of 108 properties across Singapore, the UK, Australia, the netherlands and Germany.
  - Mapletree Logistics Trust (SGX: M44U)

    An industrial REIT with a portfolio of 187 properties spread across eight countries. The price of these REITs in over one years.
- (2) Stocks in other sectors (Non-REITs,red points):
  - SGX-Singapore Exchange Limited,
  - Telecommunications
  - Singapore Telecommunications Limited,
  - Industrial Goods and shipbuilding
  - Yangzijiang Shipbuilding (Holdings) Ltd.
  - Food & Beverage
  - Wilmar International Limited (5%) Agriculture Golden Agri-Resources Ltd.
  - Transportation-Singapore Airlines Limited
  - Utilities-Sembcorp Industries Ltd
  - Services-United Overseas Insurance Limited
  - Real-estate Stocks(Orange points):
  - Keppel Ltd.
  - CapitaLand Investment Limited
  - City Developments Limited

We can observe that the majority of REITs stands higher than the 5% yield rate line which indicating that these type of assets provider a relative higher dividends to investors. Unfortunately, these blue points also falls in the left corner, where is low value stocks.

The reason behind the character of high dividends and low price is the nature of REITs. The contractual nature of commercial real estate leases and the predictability of rental income and expenses, give REITs a defensive quality.

REITs allowing analysts to more accurately forecast earnings, which helps reduce share price volatility.
According to 15th March 2024 stock price, we tabulate the daily range and one year range of four S-REITs of above analysis.

#figure(
  tablem[
| *REITs*                                            | *Daily range*     | *spread* | *52-week range*   | *spread* |
| ------------------------------------------------ | --------------- | ------ | --------------- | ------ |
| Sabana REIT \ (SGX: M1GU)                          | 0.3600 - 0.3650 | -0.005 | 0.3550 - 0.4900 | -0.135 |
| Keppel Pacific Oak US REIT \ (SGX: CMOU)           | 0.1260 - 0.1350 | -0.009 | 0.1230 - 0.4450 | -0.322 |
| Frasers Logistics & Commercial Trust \ (SGX: BUOU) | 1.0200 - 1.0400 | -0.02  | 1.0200 - 1.0400 | -0.36  |
| Mapletree Logistics Trust \ (SGX: M44U)            | 1.4300 - 1.4600 | -0.03  | 1.4300 - 1.8000 | -0.37  |
  ],
  kind: table,
  caption: "Selected REIT Daily Range"
) <REIT_range>

In contrast with other stocks, the daily range of REITs is very limited, even the 52 weeks range is not large.

== Exposure to global real estate

To investigate the risk defensive quality of REITs, we analyze the risk exposure by this asset.
REITs focus on the real estate market. Singapore is a small city-state with a finite land area. With a dense population and limited land, there is high demand for housing, both for residential and commercial purposes. Within Singapore real estate market the risk are measurable and easily control.

Moreover, besides espousing to Singapore real estate, over 90% of S-REITS own properties outside Singapore. This gives S-REITs access to growing Asian and global markets, while giving investors risk diversification opportunities by holding REITS.

For analysis, in this sub section, we use CSOP iEdge S-REIT Leaders Index ETF (SRU.SI) as a proxy for S-REITs and SG real estate market.

Top 7 Holdings of CSOP iEdge S-REIT Leaders Index ETF are list in below table. These REITs are comprise 55.04% of total assets in this ETF.

#figure(
  three-line-table[
| *REITs*                                  | *%Assets* |
| -------------------------------------- | ------- |
| CapitaLand Integrated Commercial Trust | 10.67%  |
| Mapletree Logistics Trust              | 9.17%   |
| Mapletree Industrial Trust             | 8.67%   |
| Frasers Logistics & Commercial Trust   | 7.39%   |
| Keppel REIT                            | 6.84%   |
| Keppel DC REIT                         | 6.34%   |
| Frasers Centrepoint Trust              | 5.98%   |
  ],
  kind: table,
  caption: "Selected REIT Assets"
) <REIT_assets>

=== Singapore market risk

By regressing last year's historical adjust close price of S-REITs ETF on the STI ETF, we have a general view of the risk in SG market. Following is the results:

```
                            OLS Regression Results - 1
==============================================================================
Dep. Variable:      SRU.SI_log_return   R-squared:                       0.003
Model:                            OLS   Adj. R-squared:                 -0.001
Method:                 Least Squares   F-statistic:                    0.7061
Date:                Sat, 16 Mar 2024   Prob (F-statistic):              0.402
Time:                        20:43:38   Log-Likelihood:                 668.64
No. Observations:                 227   AIC:                            -1333.
Df Residuals:                     225   BIC:                            -1326.
Df Model:                           1
Covariance Type:            nonrobust
==================================================================================
                     coef    std err          t      P>|t|      [0.025      0.975]
----------------------------------------------------------------------------------
const              0.0001      0.001      0.148      0.883      -0.002       0.002
STI_log_return    -0.0219      0.026     -0.840      0.402      -0.073       0.029
==============================================================================
Omnibus:                       86.636   Durbin-Watson:                   1.876
Prob(Omnibus):                  0.000   Jarque-Bera (JB):             1913.019
Skew:                           0.884   Prob(JB):                         0.00
Kurtosis:                      17.111   Cond. No.                         30.7
==============================================================================
```

Under OLS method, the coefficient is not statistical significant, which suggests that the systematic risk of S-REITs is less relate to the Singapore market risk. Investors can consider S-REITs as a tool to against the market risk.

=== Global market risk

As the nature of S-REITs which invest property globally, we calculate the correlation matrix of S-REITs and other market financial assets in short term.

Based on the historical adjust price 1st February to the middle of March, we compute the correlation of S-REITs and following assets:

- S REITs: CSOP iEdge S-REIT Leaders Index ETF (SRU.SI)
- Asia ex Japan REITs: NikkoAM-StraitsTrading Asia ex Japan REIT ETF (CFA.SI)
- US Bonds: iShares J.P. Morgan USD Asia Credit Bond Index ETF (N6M.SI)
- US Equities (S&P 500 Index):S&P 500 (^GSPC)
- US REITs: Prime US REIT (OXMU.SI)
- Global REIT: iShares Global REIT ETF (REET)

#figure(
  three-line-table[
| REITs   | SRU.SI | CFA.SI | N6M.SI | ^GSPC | OXMU.SI | REET |
| ------- | ------ | ------ | ------ | ----- | ------- | ---- |
| SRU.SI  | 1.00   | 0.36   | 0.08   | 0.13  | 0.59    | 0.35 |
| CFA.SI  | 0.36   | 1.00   | -0.29  | 0.32  | -0.06   | 0.02 |
| N6M.SI  | 0.08   | -0.29  | 1.00   | -0.43 | 0.26    | 0.01 |
| ^GSPC   | 0.13   | 0.32   | -0.43  | 1.00  | -0.05   | 0.32 |
| OXMU.SI | 0.59   | -0.06  | 0.26   | -0.05 | 1.00    | 0.25 |
| REET    | 0.35   | 0.02   | 0.01   | 0.32  | 0.25    | 1.00 |
  ],
  kind: table,
  caption: "Selected REITs correlation"
) <REIT_correlation>

The highest correlation is 0.59 existing between the S-REITs and U.S REIT. That is consistent with our expectation, because that S-REITs own large share of American properties. For investors hold S-REITs can be a indirect way to invest in American real estate market, and the risk may be dilute since the correlation is positive but less than one.

== Diversification tool

We conduct a empirical investing portfolio to verify the efficient of S-REITS in diversification of risk.

First, we generate following portfolios,using following three assets:
- Market index: S&P 500 (^GSPC)
- Bonds: iShares 0-5 Year TIPS Bond ETF (STIP)
- REITs: CSOP iEdge S-REIT Leaders Index ETF (SRU.SI)

=== Portfolios

- Portfolio 1: 55% Market index funds + 35% Bonds + 10% REITs
- Portfolio 2: 40% Market index funds + 40% Bonds + 20% REITs
- Portfolio 3: 33.3% Market index funds + 33.3% Bonds + 33.3% REITs
- Portfolio 4: 60% Market index funds + 40% Bonds
- Portfolio 5: 80% Market index funds + 20% Bonds

Based on the historical price from 1st January 2023 to 1st January 2024, we calculate the annual return and standard deviation of each portfolio. Plotting these five portfolio in figure 6.

#figure(
  image("Portfolio analysis.png", width: 90%),
  caption: "EFive portfolio return vs. standard deviation"
) <REITs_analysis_portfolio>

With the weight of S-REITs increase, the annual return is decreasing. This is not surprisingly, because the S-REITs ETF only own -15% for 5 years return, while the S&P 500 achieve 12% 5 years return. The more S-REITs you hold in portfolio the lower return investors get. However, our portfolio is generated by analysis purpose, the share of S-REITS is exaggerated.

It is worth to note that the portfolio 1 and portfolio 4 obtains similar annual return, while the standard deviation is different. For further analysis, we calculate the Sharpe ratio for these portfolios. As for risk free rate, we introduce the CDF interest rate 2.5%.
#set text(11pt)
#figure(
  three-line-table[
| No.         | Component                                            | Sharpe ration | Rank |
| ----------- | ---------------------------------------------------- | ------------- | ---- |
| Portfolio 1 | 55% Market index funds + 35% Bonds + 10% REITs       | 1.07          | 2    |
| Portfolio 2 | 40% Market index funds + 40% Bonds + 20% REITs       | 0.86          | 5    |
| Portfolio 3 | 33.3% Market index funds + 33.3% Bonds + 33.3% REITs | 0.87          | 4    |
| Portfolio 4 | 60% Market index funds + 40% Bonds                   | 1.03          | 3    |
| Portfolio 5 | 80% Market index funds + 20% Bonds                   | 1.39          | 1    |
  ],
  kind: table,
  caption: "Selected REITs correlation"
) <REIT_correlation>
#set text(12pt)

Considering the balance of risk and returns of these portfolios, the portfolio 1 sightly beats portfolio 4. This reversal suggests that including S-REITs can efficient diversify risk for a high volatilized portfolio.

= 3000 level for STI Index

The Straits Times Index (STI) is a leading indicator of the Singaporean stock market, with a long history when first being introduced in 1966. This index was constructed by SPH, the Singapore Exchange and SPH's consultant, Professor Tse Yiu Kuen from the Singapore Management University.

Liking all index, the STI experienced many fluctuations. In past 30 years, the STI has showed a series of ups and downs, especially, in the late 1990s and early 2000s, the index reached all-time highs, peaking at 3875.77 closing price on 11 October 2007.#footnote[https://en.wikipedia.org/wiki/Straits_Times_Index]. The development of the Singapore market was fuelled by strong economic growth and favorable market conditions.

However, the index was hit hard by the global financial crisis in 2008, declining by over 50% from the peak value. Recovering from this crisis, STI backed to 3000 level at 2011 years. Even though the index faced challenges onwards, such as 2015 when the STI collapsed 18.9% and broke below 3,000 Points. #footnote[https://fifthperson.com/4-reasons-why-the-sti-collapsed-18-9-and-broke-below-3000-points/] and the covid period decline, the STI still keep the its position around 3000 points.

#figure(
  image("STI_volumn.png", width: 90%),
  caption: "STI development path (Screen capture from Yahoo! Finance)"
) <STI_development_path>

The pace of STI growth seems become more steady, lacking of momentum. Except the economic factors' impacts, we consider another explanation that is the high dividend generated by STI. According to statistical analysis, the STI has delivered strong returns for investors over the past decade, with a total return of 61% compared to 41% for indexes such as the Dow Jones, Hang Seng, Nikkei 225, and FTSE 100. #footnote[https://www.ig.com/sg/indices/singapore-index]

Moreover, the index is calculated using a free-float market capitalization-weighted methodology, which means that the larger companies have a greater impact on the overall index value. And the large companies listed on SGX have a culture of high dividends, for instance three Banking stocks (DBS, OCBC,UOB) we analyzed in above sub-section. In total, the STI pays out a relatively high dividend, with a dividend yield of 4% annually. Comparatively, other indexes such as the S&P500 pays out only 1.5% per year. #footnote[https://www.moomoo.com/sg/learn/detail-straits-times-index-sti-in-singapore-93047-230116062]

== 3000 Points Defense Battle for SGX

It turns out dividend is also an "enemy" faced by SGX investors when fighting Singapore's version of "3000 Points Defense Battle".

When one of 30 performance-tracked stock, that say DBS (ticker: D05 / D05.SI) issued a dividend payment:

#quote(attribution: [Chapter 1 of Financial Econometric Modeling])[
  A dividend payment lowers the price by the amount of the dividend so that the closing price is greater than the opening price on the ex-dividend day. To smooth out the effect of the dividend, the closing price and all previous prices are scaled by an appropriate adjustment factor.
]

As the opening price on the ex-dividend day is lower, its Close on the ex-dividend day would also be lower than if no dividend is paid. In consequence, STI will be also be lower.

As all previous prices of DBS are scaled, DBS's trend of price history is mostly preserved. This is the comparison of DBS's price history using Adjusted Close(which is what investor usually see when checking stock's price history) and a estimated price history if dividends are added back:

#figure(
  image("dbs_d2.png", width: 90%),
  caption: "DBS Price History"
) <DBS_price>

We could see that using adjusted close price shift the whole price history curve downward while keeping its trend by appropriate scale.

On the other hand, market indexes like STI will never adjust its previous value due to stock's dividend payment. It always rely on stock's actual price. As a result, the trend of STI will be "flatten" due to stock's dividend payment.

We estimated STI for both if add back dividend and if history value is adjusted:

#figure(
  image("STI_estimated.png", width: 120%),
  caption: "STI_estimated"
) <STI_estimated>

In both case, the trend of STI will be different from actual. And in the case of add back dividend, STI will not stagnate around 3000 points since 2010, it would grow to above 4000.

This is the "hidden" return of SGX.

Some investors may look at STI history and conclude that SGX market has "zero return" in the past 15 years. Some investors may suspect that there will be returns via dividend, but couldn't find quick info about dividend yield.

We hope that Chat STI could provide some reference value to these investors.

Once again, quoting:

#quote(attribution: [Chapter 1 of Financial Econometric Modeling])[
  In most cases it is convenient to choose the adjusted closing price (denoted by Close\*) for empirical work. \
  These adjustments mean that the historical prices do not necessarily reflect the actual prices at which trades took place.
]

After learning impact of dividend on STI, we conclude that SGX shouldn't be the empirical case that researchers could just use adjusted closing price for convenience. We must use actual prices at which trades took place and dividend paid to calculated a stock's return.

With or without considering dividends add back could have huge impact when evaluating return of portfolio. The detail of dividends add back will be illustrate in section C.

= Trading Strategy<trading_strategy>

In this section, we generate the trading strategy one based on our market analysis.

== Market analysis

=== Market capitalization

Market capitalization, or "market cap," represents the total dollar market value of a company's outstanding shares of stock. we use market cap to determine a company's size, and then compare with other companies.

According to the criteria of companies'size #footnote[https://www.finra.org/investors/insights/market-cap], generally, companies can be divide into five level: mega-cap,large-cap, mid-cap, small-cap and micro-cap. Large-cap companies typically have a market capitalization of \$10 billion or more and represent major players in well-established industries and sectors. Mid-cap companies generally have a market capitalization between \$2 billion and \$10 billion. Companies with a market capitalization between \$250 million and \$2 billion are commonly classified as small-cap companies.

Based on the situation of SGX, we adjust the barriers for mid-cap at \$1.5 billion, \$100 million for small-cap and below \$100 million we see these companies as micro-cap. Then we plot the distribution of SGX market cap#footnote[Top SGX stocks by market cap: https://github.com/Wuvist/sgx3000/blob/main/mc_10B_plus.csv].

#figure(
  grid(
    columns: 2,
    gutter: 3pt,
    figure(
      image("mc_1.5B_20B.png")
      ),
    figure(
    image("mc_100M_1.5B.png")
    ),
    figure(
      image("mc_100M.png")
    ),
  ),
  caption: "SGX Stock Market Cap Distribution"
) <sgx_mc>


In the number of stocks in each group, we observe that the majority of stocks in SGX are small and micro companies, consistently with our prediction that the size limitation of SGX. For the distribution, more stocks/companies concentrate on the left side of each distribution, indicating that the market size of stocks listed on SGX is relative small.

=== Average daily trading volume

We also considered the average daily trading volume. Average daily trading volume (ADTV) is the average number of shares traded within a day in a given stock. The ADTV is an important metric of liquidity - this indicators' high or low suggest that how many different types of traders and investors are attracted to buy this stocks. We calculate the ADTV in dollar term. Based on the past one year average trading volume times the open price on 29th Mar 2024 and plot the distribution of the ADTV#footnote[Top SGX stocks by ADTV: https://github.com/Wuvist/sgx3000/blob/main/adtv_3M_plus.csv].

#figure(
  grid(
    columns: 2,
    gutter: 3pt,
    figure(
      image("adtv_300K_3M.png")
      ),
    figure(
    image("adtv_10K_300K.png")
    ),
    figure(
      image("adtv_10K.png")
    ),
  ),
  caption: "SGX Average Daily Trading Volumn(ADTV) Distribution"
) <sgx_adtv>

The distribution of ADTV is similar to the distribution of the market cap. The most of stocks of SGX shows a relative low average trading volume. The reason of the low level of liquidity may be the SGX mainly servers Singapore, which has limit population. Another important reason is the nature of stocks and investor appetites. The stocks such as REITs, given its income based nature, the trading volume is essentially low than these stocks which investors chasing for capital gains.

== Trading Strategy One

To avoid these stocks which are on the edge of unlisted, we exclude the stocks that ADTV below \$10,000 dollars before we select investment objectives. After the screening, only 273 stocks remain. These 273 stocks are randomly assigned to four groups and our four team members each select 10 stocks to simulate the real investors in SGX.

Investor 1,2,and 4 do not have the accurate and precise criteria for investing, they work as a placebo for us to compare the performance of different portfolios. Investor 3 access to the ranked market cap, ADTV and P/E ratio of these stocks. Besides, based on the previous market cap analysis, and the average P/E ratio of STI.

Investor 3 have the following investing strategy:

- (1) High market cap: only select the market cap higher than \$100 million stocks. That means only focus on the small and above size companies, ignoring the micro-cap companies.
- (2) P/E ratio: According to the Singapore market index, the Strait Times closed at 3,158.800 points in May 2023 which is just beyond the 3000 level. At that time the FTSE Straits Times recorded a monthly P/E ratio of 13.159. #footnote[https://www.ceicdata.com.cn/en/indicator/singapore/pe-ratio] Used 13.159 as a benchmark, investor 3 regard the figure below that is low P/E ratio and vice versa.
- (3) Risk diversification
  - Including one REIT in the investment portfolio to diversify the risk.

The following are each investors trading portfolios:
#figure(
  line-table[
| No.          | Trading stocks                             | Remarks        |
| ------------ | ------------------------------------------ | -------------- |
| Investor 1   | AIY,1D1,Q01,C52,C6L,N02,CMOU,J36,MZH,H15   |                |
| Investor 2   | EB5,WJP,9CI,D05,H02,SJX,Z77,F9D,O39,BVA    |                |
| Investor 3-1 | M01,5DD,CC3,i07,BN4                        | High P/E ratio |
| Investor 3-2 | L38,E5H,1D0,Z74,CY6U                       | Low P/E ratio  |
| Investor 4   | 5LY,T82U,AWX,U96,S56,CJLU,AP4,S68,A7RU,C09 |                |
  ],
  kind: table,
  caption: "Investors trading portfolios"
) <trading_portfolios>

Investor 3-2 portfolio consist of five stocks. The market cap pf these five stocks are all over \$100 million, with the maximum \$39 billions and minimum \$300 millions. The other three stocks owns around \$1 billion market cap. The P/E ratio for this portfolio are all below 13.159 as mentioned in the screening criteria. Typically, involving one REIT "CY6U" as a diversification tool and capturing the dividends.

In general, a high P/E suggests that investors expect higher earnings growth than those with a lower P/E. A low P/E can indicate that a company is undervalued or that a firm is doing exceptionally well relative to its past performance. Relying totally on PE ratios without paying attention to fundamentals and growth of companies is also not useful. Large-cap stocks are mature, yet has limitation in growth. Once a company grows very large, it may no longer be as nimble or able to take advantage of new growth opportunities. Hence, under the low P/E ratio, the investor 3-1 strategy combine one large-cap stocks and four small-cap to balance the portfolio.

The investor 3-2 portfolio as our main "value and growth investing" strategy, aim at investing stocks which has relative high market cap and low P/E ratio. For comparison purpose, investor 3-1 select relative high market cap combination.

= Dividends Add Back Approach<addback>

The actual return of investor transacting a stock paid dividend is:

$ (P_t + D_t) / P_(t-1) - 1 $

And it will be different just using adjusted close price:

$ P_t^"Adj Close" / P_(t-1)^"Adj Close" - 1 $

== D8DU's case

Considering SGX stock `D8DU`, assume investor buy `D8DU` on 2022-03-03 at its close price:

- Actual Close: 0.077000
- Adjusted Close: 0.048462

Investor sell `D8DU` on 2024-03-15 at its close price.

As this is a recent date and no dividend has been paid after 2024-03-15, so: both close price & adjusted close are the same:

```
Actual Close = Adjusted Close: 0.032
```

During the 2 year holding period, two dividends are paid:

- 2024-02-15: 0.015
- 2022-08-12: 0.016

Return using Adjusted Close: -34.0%

$ 0.032/0.048462 - 1 = -0.339689 $

Return using dividend add back: -18.2%

$ (0.032 + 0.016 + 0.015)/0.077000 - 1 = -0.181818 $

Difference in return: 86.8%
$ (-0.339689)/(-0.181818) - 1 = 0.868289 $

D8DU is a REITs, which is required by regulation that dividend must been paid to investor regularly, and such dividend payment could be a major portion of the overall return compared with price movements. 86.8% is a huge difference that we must not ignore.

== More case

The difference in return between using Adjust Close and actual return also varies from stock to stock.

For example, C38U will have -62.02% difference in return for the same period as D8DU illustrated above. We actually checked all SGX stock for the same two year period, as the difference in return spread between -62.02% (C38U) to 86.8% (D8DU).

Furthermore, it's impossible to use adjusted close for some stock when we check through the 20+ years history:

- Y92: Adjusted Close is zero

```csv
Date,Open,High,Low,Close,Adj Close,Volume
2006-05-30,0.280000,0.280000,0.260000,0.270000,0.000000,316209000
2006-05-31,0.260000,0.265000,0.255000,0.260000,0.000000,154859
2006-06-01,0.270000,0.270000,0.260000,0.260000,0.000000,72665
```

- T14: Adjusted Close is negative

```csv
Date,Open,High,Low,Close,Adj Close,Volume
2001-06-01,0.387500,0.412500,0.387500,0.412500,-0.000011,68552000
2001-06-04,0.425000,0.535000,0.425000,0.530000,-0.000014,160426000
2001-06-05,0.540000,0.550000,0.432500,0.447500,-0.000012,134070000
```

#quote(attribution: [Chapter 1 of Financial Econometric Modeling])[
  Very often dividends are ignored in the computation of returns. This practice stems from the reality that dividends are paid relatively infrequently and constitute a minor proportion of the overall return compared with price movements.
]

We believe that we have an exceptional case here. We need to use add back dividend return for analysing SGX stock and evaluate our trading strategy. Dividends must not be ignored in our case.

= Return Chasing Trading Strategy (RCTS)<rcts>

Inspired by Trading strategy one mentioned above, we would like to further adapt it and test it throughout the 24 years available transaction history:

- Step 1: Find top 10 return stocks in 12 month period with all cash
  - Only consider stocks with ADTV higher than 100K SGD
- Step 2: Buy the 10 best performing stocks
  - Each stock has equal weight in the portfolio, i.e. buy with the same cash amount
- Step 3: Hold the stocks for 3 months
- Step 4: Sell all stocks no matter profit or lost
- Repeat from Step 1

Since we have stock history up to beginning of 2000, above strategy will start on beginning of 2001. It transacts only at the beginning and end of each quarter and continue until 2024 Q1.

(We assume all stocks are sold on 2024-03-15 for the last transaction, which is close to one whole quarter.)

All returns are calculated using add back division approach.

During this 23 yr + 1Q period and total of 93 portfolios#footnote[Portfolio details: https://github.com/Wuvist/sgx3000/blob/main/RCTS_portfolio.txt], RCTS gives 207.16% return. Its annual percentage yield (APY) is about 5%, which is about two times for the risk free rate 2.5% (Interest rate of CPF ordinary account). It also beat the market, ES3 - Straits Times Index ETF gives merely gives about 1.5% APY since 2010. ES3 will actually have negative return if we track it since 2008. STI is revamped and relaunched on 10 January 2008, and ES3 was founded. This is obviously due to impact of Global Financial Crisis (GFS). Yet, RCTS stood the test of GFS.

For curiosity, we also evaluate RCTS using return calculated by adjusted close price. It gives a whopping `9717%` overall return! But as shown earlier, return calculated using adjusted close price is not the actual return that investor will get. In order to calculate investor's actual return, we must use add back dividend approach. RCTS with portfolio construction using return calculated by adjusted close price actually only give 83.82% overall return, much lower than portfolios constructed using add back dividend approach. This may implies that portfolios were not constructed correctly at the beginning, the trading strategy chased fake return.

== RCTS with different weights

We further evaluate RCTS with two different portfolio weight adjustments:

- Weighted by return: stocks in the portfolio are weighted according to its return in past 12 months. The higher the return, the higher its weight.
- Weighted by risk: stocks in the portfolio are weighted according to its risk in past 12 month. The higher the risk, the lower its weight.

#figure(
  three-line-table[
| *Weighted*     | *Equal*  | *By Return* | *By risk* |
| -------------- | -------- | ----------- | --------- |
| overall return | 2.071662 | 1.384823    | 2.657403  |
| mean return    | 0.029004 | 0.030233    | 0.031248  |
| risk           | 0.037491 | 0.045624    | 0.038815  |
  ],
  kind: table,
  caption: "RCTS with different weights"
) <RCTS_with_weights>

As shown in @RCTS_with_weights, when RCTS weighted by return, its overall return drop by 33% and risk increased by 22%. This could be due to market is turing its trend after 18 months of growth.

On the other hand, RCTS weighted by risk performed the best, its overall return during the whole 23 years period is 28% higher than with equal weight, but the risk only increased by 3.5%. This may be suggesting when market changed its trend, the stocks with lower risk in the past 12 months, may gain additional returns.

Further study of RCTS using different holding and evaluating period may provide more insight about the dynamic of SGX top performing stocks. Nonetheless, above analysing should be sufficient to show that SGX's top performing stock trend could last over a period of 15 months, whereas such trend in other stock markets would be much shorter.

= Comparison two strategies using Diebold-Mariano test<dm_test>

We have two main trading strategies: one is investor 3-2 "Value Growth" investing strategy, and another Return Chasing Trading Strategy (RCTS) comes from past performance of SGX. We conduct the Diebold-Mariano Test to compare these two strategies.

The Diebold-Mariano (DM) test is a statistical test used to compare the forecast accuracy of two different forecasting methods applied to the same time series data. In our case we compare two strategies annual return by this test:

- Step 1: calculate the return for each trading strategy for one specific year;
- Step 2: select annual return for strategy a and b, compute the standard error
- Step 3: $D_i = "Return"^a - "Return"^b, i=1,2,3,4 $ and $ macron(D)= 1/n sum D_i$
- Step 4: test $E[D_i]=0$
  - Under the null hypothesis (H0), both models have equal amount of returns;
  - Under the against hypothesis(Ha), the return from two strategies are different.
  - If the $E[D_i]>0$, the return of trading strategy greater than the second one, and vice versa.

S strategies are series of Return Chasing Trading Strategy (RCTS):

- S0: strategy stands equally invest in each top return stocks strategy
- S1: strategy stands for the portfolio weighted by the past return rank strategy
- S2: strategy stands for the portfolio weighted by the past risk rank strategy

V strategies are series of "Value Growth" investing strategy:

- V1: strategy stands for the high market cap and high P/E ratio
- V2: strategy stands for the high market cap and low P/E ratio

== 2017 test results

#figure(
  three-line-table[
| strategies | mean_difference | dm_test   | p_value  |
| ---------- | --------------- | --------- | -------- |
| S0 vs V2   | -0.111367       | -1.997241 | 0.139699 |
| S1 vs V2   | -0.143629       | -2.168592 | 0.118613 |
| S2 vs V2   | -0.105646       | -1.807976 | 0.168331 |
| V1 vs V2   | 0.077579        | 2.805210  | 0.067560 |
  ],
  kind: table,
  caption: "2017 test results"
) <2017_test>

In 2017 case, the S strategies are not perform well compare to V strategies. The t-test of the second test outcome is sightly greater than 2. The test outcome suggests that the RCTS provide less return than " Value growth" investing strategy.

Besides, the V1 high market cap and high P/E ration portfolio offers a higher return than the combination of high market cap and low P/E ratio. Considering the 2017 the economic situation of Singapore, the investors may trend to chasing for well-developed companies that may be the reason why the V1 is out perform than V2.

== 2022 test results

#figure(
  three-line-table[
| strategies | mean_difference | dm_test   | p_value  |
| ---------- | --------------- | --------- | -------- |
| S0 vs V2   | 0.014597        | 0.694107  | 0.537536 |
| S1 vs V2   | 0.013909        | 0.317385  | 0.771758 |
| S2 vs V2   | 0.020648        | 0.754232  | 0.505512 |
| V1 vs V2   | -0.018485       | -2.294176 | 0.105551 |
  ],
  kind: table,
  caption: "2022 test results"
) <2022_test>

The outcome of 2022 is different from 2017 case. The S strategies are all have better return than V2 strategies. However, the p-value of the first three test are relative large, suggesting that we cannot reject the null hypothesis. That make us hard to identify the disparity of two strategies' returns. The v1's return is lower than V2, indicating that these stocks which have lower P/E ratio perform better in this period.

More importantly, through these two cases, we observer that the test outcome is not unique, for each year the performance of different strategies varies. Due to the two strategies comparison is subject to the responding economic growth and other stable factors, hence, we need to analyze the return performance in a dynamic way.

== Regress the return difference on GDP growth

In this sub-section, we obtain the Singapore GDP data as our stable variable. Taking the S0 strategy and V1 strategy as the representations of the RCTS and "Value growth" investing strategy, we conduct the following regression:

$ Delta R_i = "Return"^s_i - "Return"^v_i $


Regress $Delta R_i$ on the constant and GDP data:$ Delta_i = beta_0 + beta_1 "GDP"_i + epsilon_i $

As our portfolio only available from 2017, we limit this regression data from 2017 onwards.

```
                            OLS Regression Results - 2
==============================================================================
Dep. Variable:                      y   R-squared:                       0.191
Model:                            OLS   Adj. R-squared:                  0.160
Method:                 Least Squares   F-statistic:                     6.130
Date:                Tue, 02 Apr 2024   Prob (F-statistic):             0.0201
Time:                        20:42:05   Log-Likelihood:                 7.5313
No. Observations:                  28   AIC:                            -11.06
Df Residuals:                      26   BIC:                            -8.398
Df Model:                           1
Covariance Type:            nonrobust
==============================================================================
                 coef    std err          t      P>|t|      [0.025      0.975]
------------------------------------------------------------------------------
const          0.0639      0.038      1.681      0.105      -0.014       0.142
x1            -1.7423      0.704     -2.476      0.020      -3.189      -0.296
==============================================================================
Omnibus:                       10.770   Durbin-Watson:                   2.042
Prob(Omnibus):                  0.005   Jarque-Bera (JB):                9.574
Skew:                           1.132   Prob(JB):                      0.00834
Kurtosis:                       4.756   Cond. No.                         19.4
==============================================================================
```

The coefficient of the GDP stable variable is -1.74 with a p-value 0.02. This figure suggests that when the GDP achieve a large growth, the return difference between the S0 and V1 strategy becomes smaller. Recalling the S0 is generated by the past 30 years top returns stocks, we can have a insight that the V1 strategy stocks (high market cap and low P/E ratio) catch up the performance of top return stocks when the economic development well. However, when the society does not have a strong economic increase, these return offered by the V1 not exceed these RCTS stock.

The result unveil the fact that for investors who aiming at the high market cap and under valued stocks is possible to approaching the highest return on the exchange market when they are supported from fundamental economic condition. But when the economic condition becomes more complex, this simple "Value growth investing" strategy may not grantee your return.

= Conclusion

Our comprehensive analysis of the Singapore Exchange (SGX) uncovers the dynamic interplay of diverse sectors and the unique investment opportunities they present. The analysis spans from the dividend-rich environment of SG banks to the thriving Real Estate Investment Trusts (REITs) market, highlighting SGX's appeal for those seeking steady income streams through dividends and risk diversification.

Central to our investigation are two trading strategies: the "Value Growth" investing strategy, which emphasizes high market cap and low P/E ratio stocks along with REITs for diversification, and the Return Chasing Trading Strategy (RCTS), which adapts portfolio composition based on past performance to harness momentum. Each strategy reflects a distinct approach to capitalizing on SGX's market potential.

A pivotal aspect of our analysis is the underscored importance of employing the add-back dividend approach for return calculation. This method, critical for achieving a genuine reflection of investment performance, reveals the profound impact dividends have on total returns. Particularly for markets like SGX, where dividend payouts constitute a significant portion of investor returns, the traditional adjusted close price method falls short of capturing the true investment outcome. Our empirical evidence strongly advocates for the add-back dividend approach, underscoring its necessity in accurately assessing and comparing the efficacy of investment strategies.

The comparative analysis, illuminated by the Diebold-Mariano Test, showcases how economic conditions influence the performance of the "Value Growth" strategy relative to RCTS. It becomes evident that the "Value Growth" strategy, with its reliance on economic growth, stands to benefit significantly during periods of economic prosperity. This is in stark contrast to more volatile economic times, where RCTS's flexibility may offer a strategic advantage.

In synthesizing our findings, it is clear that the SGX serves as a fertile ground for a variety of investment strategies. The critical takeaway, however, is the indispensable role of the add-back dividend approach in return calculation, ensuring investors receive a transparent and accurate measure of performance. As investors navigate the SGX, incorporating both the "Value Growth" strategy and RCTS—tempered by the nuanced understanding provided by the add-back dividend approach—can offer a balanced path to capitalizing on growth and income opportunities within this vibrant market.

= Appendix

All data and code used in above analysis are available at: https://github.com/Wuvist/sgx3000

#set text(gray)
#set align(right)
#total-words words in total.
