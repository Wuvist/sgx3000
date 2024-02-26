# Everything you need to know about Singapore equity market.

## 1. Research Question and Motivation

We start with brainstorming:

As foreigner students, why you chose Singapore as your destination ?

I believe one of reason is that Singapore is a wealthy country. Singapore's economy is often referred to as a "miracle" due to its rapid transformation from a developing country to a developed, high-income economy in a relatively short period of time.

The seconde question is that you want to be wealthy in Singapore ? How would you do to achieve this goal?

There is a option - invest in Singapore equity market.

How do you know about the Singapore equity market? While the Singapore stock market may not be as exciting as its US counterpart, it is known for its stability and high dividends.

Our team aims at the following research question about Singapore equity market:

### 1. The overall introduction of Singapore equity market.

### 2. The characterizes of Singapore equity market.

### 3. The development path of Singapore equity market.

### 4. Based on above analysis, give the conclusion of the worthiness of investing in Singapore equity market. And some suggestion of investment.

### 5. Simulated investment in Singapore equity market. Analysis the results.

# 2. Overall introduction

## 2.1 Data Needed

# 3.The characterizes of Singapore equity market

### 3.1 High Dividends

### 3.2 Accessibility and Connection

#### 3.2.1 Analysis field

In this section, We will use REITS market to analysis the accessibility and connection of Singapore equity market.

_Data Needed_: The 42 REITs listed on SG exchange. The data including:

1. The price of these REITs in over 5 years.
2. The dividends they paid in past 5 years, and the yields.
3. The price of SG market indicator "The Straits Times Index (STI)",American market indicator "The Standard and Poor's 500" and "Chinese market The Shanghai Stock Exchange (SSE) Composite Index" over past one year.
4. The price of SG bond index "ABF Singapore Bond Index Fd" over pase one year.
5. For comparison of U.S. market, the price of "FTSE NAREIT Equity REIT Index" and "S&P 500" over past one year.

##### (1). The Real Estate Investment Trust (REIT)

###### (1.1) What is REITs

A real estate investment trust (REIT) is a company that owns, operates, or finances income-generating real estate. They package these real estate as mutual funds and put into equity market.

The function of REITs is similar to stock. They pool the capital of numerous investors. This makes it possible for individual investors to earn dividends from real estate investments—without having to buy, manage, or finance any properties themselves. Compared with physical real estate investments, REITs is more accessible and liquid.

REITs invest in most real estate property types, including apartment buildings, cell towers, data centers, hotels, medical facilities, offices, retail centers, and warehouses. In other words, REITs is flexible in invest in commercial, public and residential property at period. In contrast, the physical real estate investments may not achieve this diversification.

Types of REITs:

| REITs          | own and manage                   | Revenues            |
| -------------- | -------------------------------- | ------------------- |
| Equity REITs   | income-producing real estate     | rents               |
| Mortgage REITs | Holds mortgages on real property | net interest margin |
| Hybrid REITs   | 1                                | 1                   |

###### (1.2) S-REITs

Singapore REITs are an important component of Singapore’s stock market

Largest REIT market in Asia ex-Japan.
<https://www.reitas.sg/singapore-reits/overview-of-the-s-reit-industry/>

##### (2). characterizes of REITs

###### (2.1) High dividends

By law and IRS regulation, REITs must pay out 90% or more of their taxable profits to shareholders in the form of dividends. As a result, REIT companies are often exempt from most corporate income tax.

We should generate a visualized view of that how the dividends from REITs is high.

_Approach_:

1. Plot the REITs yield rate and average yield, compare the return from REITs sector to the average return from other sector.

2. Plot the average distribution yields by sub-Sector of REITs.

##### (2.2) Exposure to global real estate

Over 90% of S-REITS own properties outside Singapore. Which market the REITs suffer most?

_Approach_:

1. Regress the FTSE ST REIT Index on three different market, identify the foreigner market contributor of the price of REITs.

2. Based on above regression, use CAPM model to calculate the $\beta$ of REITs for further analysis.

#### (2.3) Long-term investment

REITs offer a strong, stable annual dividend and the potential for long-term capital appreciation.
_Approach_:

1. Using the average annual total returns in FTSE ST REIT Index to generate the yield curve from 1 year to 25 years.

2. In contrast, plot the yield curve in stock index, bonds of SG market, combined with U.S. REITs and U.S. Market index.

3. Compare the long term return of each financial assets, to analysis the connection of REITs and other equity and identify the long-term advantage of REITs.

##### (2.4) Mitigate economic cycle risk

Combining assets that exhibit low performance correlation can play an important role in reducing portfolio risk without sacrificing return potential. REITs is a good portfolio diversifier.

_Approach_:

1. Generate following portfolios:
   (1) 55% Market index funds + 35% Bonds + 10% REITs
   (2) 40% Market index funds + 40% Bonds + 20% REITs
   (3) 33.3% Market index funds + 33.3% Bonds + 33.3% REITs
   (4) 60% Market index funds + 40% Bonds
   (5) 80% Market index funds + 20% Bonds

2. Calculate the expected returns, standard deviation of returns and Sharpe ratio on these portfolios.

3. Rank these portfolio under Sharpe ration, and plot the scatter diagram in average return and standard deviation.

4. Compare the average annualized return between the portfolios with REITs and without REITs.
   Analysis the ability of REITs in diversification of risk.

### 3.3 Low liquidity and risk

# 4.The development path of Singapore equity market.

# 5. Simulated investment in Singapore equity market
