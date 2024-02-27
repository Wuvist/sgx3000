# Financial Econometrics proposal

## Everything you need to know about Singapore equity market.

# 1. Research Question and Motivation

When Chinese market are fighting the defense battle of 3000 points once again, we are also amazed by the Singapore stock market: StraitsTime Index - STI also have stayed around 3000 points for almost 20 years. Does investors in Singapore also fight for defense battle of 3000 points? We are curious and decide to find out.

Singapore is small, so does Singapore Stock Exchange SGX. It's possible to cycled around Singapore island within one day. We also wanted to challenge ourselves, to see if we could investigate everything you need to know about Singapore equity market within a term project.

Our team aims at the following research question about Singapore equity market:

1. The overall introduction of Singapore equity market.
1. The characterizes of Singapore equity market.
1. The development path of Singapore equity market.
1. Based on above analysis, give the conclusion of the worthiness of investing in Singapore - quity market. And some suggestion of investment.
1. Simulated investment in Singapore equity market. Analysis the results.

# 2. Overall introduction

SGX was formed on 1 December 1999 as a holding company. The share capital of some former exchange companies, namely Stock Exchange of Singapore (SES), Singapore International Monetary Exchange (SIMEX) that was founded in 1984 and Securities Clearing and Computer Services Pte Ltd (SCCS). SGX is ASEAN's second largest market capitalization after Indonesia Stock Exchange at US$585.97 billion as of September 2023.

Fun fact: SGX has one of the longest trading hours - 09:00am - 12:00pm 01:00pm - 05:00pm

Currently, there are 1384 securities tranding on SGX, including 587 stocks, 69 ETFs, and 41 REITs(including 6 business trusts).

We managed to crawl price history of 712 securities from Yahoo Finance up to 2000-01-01.

# 3. The characterizes of Singapore equity market

* List different type of securities on SGX, and their brief introduction

## 3.1 High Dividends

SGX gives significant dividends to investor. We could re-estimate STI if no dividends are given like NASDAQ(Most tech firms don't give dividends).

## 3.2 Accessibility and Connection (DY)

### 3.2.1 Analysis field

In this section, We will use REITs market to analysis the accessibility and connection of Singapore equity market.

#### 3.2.1.1 Data Needed:

##### 3.2.1.1.1 Specific REITs:

###### 3.2.1.1.1.1 The 41 REITs listed on SG exchange currently. Selecting following REITs:

**Sabana REIT (SGX: M1GU):**

An industrial REIT with a portfolio of 18 properties in Singapore covering high-tech industrial, warehouse and logistics, and general industrial sectors.

**Keppel Pacific Oak US REIT (SGX: CMOU):**

An office REIT with 13 freehold office buildings and business campuses across eight markets in the US.

**Frasers Logistics & Commercial Trust (SGX: BUOU)**

A diversified portfolio of 108 properties across Singapore, the UK, Australia, the netherlands and Germany.

**Mapletree Logistics Trust (SGX: M44U)**

An industrial REIT with a portfolio of 187 properties spread across eight countries. The price of these REITs in over one years.

###### 3.2.1.1.1.2 The dividends above fist four REITs paid in past two years.

##### 3.2.1.1.2 Market analysis:

**CSOP iEdge S-REIT Leaders Index ETF S$ (SRT)** Currency in SGD
**CSOP iEdge S-REIT Leaders Index ETF (SRU.SI)** Currency in USD

The CSOP iEdge S-REIT Leaders Index ETF (the "Sub-Fund") is a sub-fund of the CSOP SG ETF Series I. The Index is concentrated in REITs which are listed on the SGX-ST.SGD Counter Stock Code: SRT, USD Counter Stock Code: SRU

**The Straits Times Index (STI)** Currency in SGD
SG market indicator

**SPDR S&P 500 ETF Trust (SPY)** Currency in USD
American market indicator

**Dow Jones Global Index (^W1DOW)"**
Global market indicator

above index price over past one year.

##### 3.2.1.1.3 Other asset

**ABF Singapore Bond Index Fd (A35.SI)**

The price of SG bond index over past five year.

#### 3.2.1.2 Analysis:

##### (1) The Real Estate Investment Trust (REIT)

**(1.1) What is REITs**

A real estate investment trust (REIT) is a company that owns, operates, or finances income-generating real estate. They package these real estate as mutual funds and put into equity market.

The function of REITs is similar to stock. They pool the capital of numerous investors. This makes it possible for individual investors to earn dividends from real estate investments without having to buy, manage, or finance any properties themselves. Compared with physical real estate investments, REITs is more accessible and liquid.

REITs invest in most real estate property types, including apartment buildings, cell towers, data centers, hotels, medical facilities, offices, retail centers, and warehouses. In other words, REITs is flexible in invest in commercial, public and residential property at period.

In contrast, the physical real estate investments may not achieve this diversification.
<div style="page-break-after: always;"></div>
Types of REITs:

| REITs          | own and manage                   | Revenues            |
| -------------- | -------------------------------- | ------------------- |
| Equity REITs   | income-producing real estate     | rents               |
| Mortgage REITs | Holds mortgages on real property | net interest margin |
| Hybrid REITs   | Combine above two                | Combine above two   |

**(1.2) S-REITs**
Singapore REITs are an important component of Singapore’s stock market

Largest REIT market in Asia ex-Japan.
https://www.reitas.sg/singapore-reits/overview-of-the-s-reit-industry/

##### (2) characterizes of REITs

**(2.1) High dividends**

By law and IRS regulation, REITs must pay out 90% or more of their taxable profits to shareholders in the form of dividends. As a result, REIT companies are often exempt from most corporate income tax.

We should generate a visualized view of that how the dividends from REITs is high.

Approach:

1. Plot the REITs yield rate and average yield in stock (such as DBS Group Holdings Ltd, Singtel and etc.), compare the return from REITs sector to the average return from other sector.
2. Plot the SREITs yields vs other Asset Classes (such as STI and bonds)

**(2.2) Exposure to global real estate**

Over 90% of S-REITS own properties outside Singapore. Which market the REITs suffer most?

Approach:

1. Regress these REITs on three different market (SG, US and global market index), identify the foreigner market contributor of the price of REITs.
1. Tabulate the Correlation Matrix Between SREITs and other assets in different market.

**(3) Long-term investment**

REITs offer a strong, stable annual dividend and the potential for long-term capital appreciation.

Approach:

1. Using the average annual total returns in CSOP iEdge S-REIT Leaders Index ETF to generate the yield curve from 1 year to 5 years.
1. In contrast, plot the yield curve in stock index, bonds of SG market, combined with U.S. stocks and U.S. Market index.
1. Compare the long term return of each financial assets, to analysis the connection of REITs and other equity and identify the long-term advantage of REITs.

**(4) Mitigate economic cycle risk**
Combining assets that exhibit low performance correlation can play an important role in reducing portfolio risk without sacrificing return potential. REITs is a good portfolio diversifier.

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

# 4.The development path of Singapore equity market.

Major events of SGX in chronical order:
- S Chip 龙筹股 China-concept stocks on SGX
    - 2010, 153 S Chip stocks
- Peak at Oct 2007
- Asian Finacial Crisis
- Global Financial Crisis
- 2015–2016 Chinese stock market turbulence
- Covid-19
- 2023 Top financial centre in APAC

# 5. Simulated investment in Singapore equity market

* Select only active securities (set daily trading volumns threshold)
* Re-adjust prices by adding back dividends
* Set risk free interest rate to be 2.5% (interest rate of CPF ordinary account)
* Recalculate alpha / beta
* Find from past data(Last 1/2/5/10/20 year):
   * Best performing stock
       * High alpha
        * High beta
        * etc
    * Porfolio with lowest risk
    * Find correlation among stocks
      * 1 day lag
        * 1 week lag
* Manually evaluate results and propose different trading strategy
* Back test with 2024 data
