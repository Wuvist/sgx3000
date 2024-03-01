# Making money in SGX

## Everything you need to know about SG equity market

# Motivation

When Chinese market are fighting the defense battle of 3000 points once again, we are also amazed by the Singapore stock market: StraitsTime Index - STI also have stayed around 3000 points for almost 20 years. Does investors in Singapore also fight for defense battle of 3000 points? We are curious and decide to find out.

Singapore is small, so does Singapore Stock Exchange SGX. It's possible to cycled around Singapore island within one day. We also wanted to challenge ourselves, to see if we could investigate everything you need to know about Singapore equity market within a term project.

Our team aims at the following research question about Singapore's equity market:

1. The overview of SG equity market.
1. The characteristics of SG equity market.
1. The development path of SG equity market.
1. Based on above analysis, give the conclusion of the worthiness of investing in Singapore - equity market and some suggestion of investment.
1. Simulated investment in SG equity market. Analysis the results.

# Overview of SG equity market

By displaying the by sector map, we address the current situation of the SGX equity market.

## Market Capitalization

SGX hosts a diverse range of companies from various industries. The total market capitalization of companies listed on SGX is a significant indicator of SG's economic importance.

Currently, there are 1384 securities trading on SGX, including 587 stocks, 69 ETFs, and 41 REITs(including 6 business trusts).

SGX is ASEAN's second largest market capitalization after Indonesia Stock Exchange at US$585.97 billion as of September 2023. As of February 2024 Singapore Exchange has a market cap of $7.62 Billion.

## International Listings

SGX is known for its international appeal, with numerous foreign companies choosing to list there, such as CapitaLand China Trust (CLCT), Hutchison Port Holdings Trust (HPHT), NIO, Prudential PLC, Alita Resource Limited. This not only brings in capital from abroad but also enhances Singapore's status as a global financial center. The presence of international companies contributes to the cross-border flow of funds, investment diversification, and economic resilience.

## SGX's role in the Financial Landscape

SGX is more than a securities exchange; it's a cornerstone of Singapore's financial sector, supporting banking, asset management, and fintech. As a crucial economic pillar, SGX, alongside MAS, ensures strong corporate governance and regulatory standards, safeguarding investors and making the Singapore appealing to global entities. This synergy fosters Singapore's economic stability and growth.

## Trading Volume and Liquidity

The trading volume on SGX, which includes stocks, bonds, derivatives, and other financial instruments, _underscores_ its role in providing liquidity to the market. SGX's derivatives market is particularly notable for its size and diversity, including commodities, currencies, and indices, attracting international traders, currently have 643 companies listed in it.

# The characteristics of SG equity market

## High dividends

The Straits Times Index (STI) comprises 30 stocks representing the largest and most active publicly listed companies on the SGX. These 30 stocks are considered the main indicators of the Singapore stock market, reflecting the overall performance of the market in Singapore.

STI is consolidating around 3000 points for the last 15 years, is the heigh dividends the reason why? What are the components of STI? Do they have high dividends?

In the Singapore market, the three largest companies are all banks, namely DBS, OCBC, and UOB and they occupy 20% 13% 11% of the STI. (44% in total)

How does their stock price preform?
Data table of those three banks.

Compare with other markets (US and China)
Construct comparison with other markets (scatter plot / 45 degree line)?

Calculate their stock price if dividends are used for buyback shares

## Accessibility and Connection via REITs

In this section, We will use REITs market to analysis the accessibility and connection of Singapore equity market.

The 41 REITs listed on SG exchange currently. We select the following for REITs analysis:

- Sabana REIT (SGX: M1GU)
- Keppel Pacific Oak US REIT (SGX: CMOU)
- Frasers Logistics & Commercial Trust (SGX: BUOU)
- Mapletree Logistics Trust (SGX: M44U)

We select the following securites for market analysis:

- CSOP iEdge S-REIT Leaders Index ETF (SRT)
- CSOP iEdge S-REIT Leaders Index ETF (SRU.SI)
- SPDR Straits Times Index ETF (ES3.SI)
- SPDR S&P 500 ETF Trust (SPY)
- Dow Jones Global Index (^W1DOW)

Finally, we select as other asset for analysis:

- ABF Singapore Bond Index Fd (A35.SI)

### (1) The Real Estate Investment Trust (REIT)

A real estate investment trust (REIT) is a company that owns, operates, or finances income-generating real estate. They package these real estate as mutual funds and put into equity market.

Singapore REITs are an important component of Singapore’s stock market, and it's the largest REIT market in Asia ex-Japan: https://www.reitas.sg/singapore-reits/overview-of-the-s-reit-industry/

### (2) Characteristics of REITs

#### (2.1) High dividends

By law and IRS regulation, REITs must pay out 90% or more of their taxable profits to shareholders in the form of dividends. As a result, REIT companies are often exempt from most corporate income tax.

We should generate a visualized view of that how the dividends from REITs is high.

Approach:

1. Plot the REITs yield rate and average yield in stock (such as DBS Group Holdings Ltd, Singtel and etc.), compare the return from REITs sector to the average return from other sector.
2. Plot the SREITs yields vs other Asset Classes (such as STI and bonds)

#### (2.2) Exposure to global real estate

Over 90% of S-REITS own properties outside Singapore. Which market the REITs suffer most risk?

Approach:

1. Regress these REITs on three different market (SG, US and global market index), identify the foreigner market contributor of the price of REITs.
1. Tabulate the Correlation Matrix Between SREITs and other assets in different market.

US market maybe most relevent:

- Linkage of USD & SGD
- Morgage rate linkdage between US & SG
- Free Trade Agreement

#### (3) Long-term investment

REITs offer a strong, stable annual dividend and the potential for long-term capital appreciation.

Approach:

1. Using the average annual total returns in CSOP iEdge S-REIT Leaders Index ETF to generate the yield curve from 1 year to 5 years.
1. In contrast, plot the yield curve in stock index, bonds of SG market, combined with U.S. stocks and U.S. Market index.
1. Compare the long term return of each financial assets, to analysis the connection of REITs and other equity and identify the long-term advantage of REITs.

Benchmark with 2.5% risk free investment CPF ordinary account.

#### (4) Mitigate economic cycle risk

Combining assets that exhibit low performance correlation can play an important role in reducing portfolio risk without sacrificing return potential. Our analysis could find out if REITs is a good portfolio diversifier.

Approach:

1. Generate following portfolios:
   - 55% Market index funds + 35% Bonds + 10% REITs
   - 40% Market index funds + 40% Bonds + 20% REITs
   - 33.3% Market index funds + 33.3% Bonds + 33.3% REITs
   - 60% Market index funds + 40% Bonds
   - 80% Market index funds + 20% Bonds
2. Calculate the expected returns, standard deviation of returns and Sharpe ratio on these portfolios.
3. Rank these portfolio under Sharpe ration, and plot the scatter diagram in average return and standard deviation.
4. Compare the average annualized return between the portfolios with REITs and without REITs.
   - Analysis the ability of REITs in diversification of risk.

## 3.3 Low liquidity and risk

We could consider index ETF in SGX(ES3) and US(SPY). Assuming they are representative of their market.

Alternatively, we could also look at bank stocks (DBS for SGX and HSBC for HSI) as they are major stocks in many market.

By comparing liquidity indicators: returns, trading volume and bid/ask spread; we could conduct correlation analysis between liquidity and risk. Thus, find out how's SGX's low liquidity impact its risk comparing with other markets.

# 4.The development path of SG equity market

SGX was formed on 1 December 1999 as a holding company, as a merge of three former exchange companies.

Since then, the major events in SG equity market are:

- S Chip(龙筹股) China-concept stocks on SGX
  - 2010, 153 S Chip stocks
- Oct 2007: STI's historical peak at 3805.07
- 2007-2008 Global Financial Crisis
- Feb 2009: STI's 20 year low at 1594.87
- 2015–2016 Chinese stock market turbulence
- Dec 2019-Mar 2021: Covid-19
- 2023: SG overtake HK become Top 1 financial centre in APAC

We would performance event analysis of Covid-19 to see how it impact SG equity market, and recovered with comparison to HANG SENG INDEX (HSI) and SPX.

# 5. Simulated investment in SG equity market

We would analysis all 712 SGX securities's price history available from Yahoo Finance between 2000-01-01 and 2024-02-29. We evaluate analysis result from price history before 2024-01-01 and come out with few trading strategies. And then back test these strategies with data between 2024-01-01 and 2024-02-29.

Steps for price history analysis:

- Re-adjust history prices by adding back dividends
- Group securities into industries
- Analyze data of past 1/2/5/10/20 year:
  - Recalculate alpha & beta in CAPM model for each security/industry
    - Risk free yield: 2.5% (interest rate of CPF ordinary account)
    - Market yield: SPDR Straits Times Index ETF(ES3)
  - Find correlation among securities: 1 days/ 5days(i.e. 1 week) lag
- Manually evaluate the result
- Propose different trading strategies:
  - Highest Jensen's alpha
  - Highest Sharpe ratio / Treynor index
  - Portfolio with lowest risk
  - Buy & sell following major stocks, like DBS
  - Forecast major stock using AR model
- Back test with 2024 data

All our data & analyze code are open sourced at: https://github.com/Wuvist/sgx3000

# Conclusion

Not for investment advise, our analysis shows that SGX could be an diversifying option for investors.
