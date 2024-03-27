# Simulation
lh, tq, dy1, dy2, ww, ql

https://docs.google.com/presentation/d/1aaE1nL5iQNZ1JU5ynkbGwoOUI-MUpjpsLuqWJ0mU5KE/edit#slide=id.g26bec46e044_0_39

# QL
* [x] Oil & Chem
* [ ] Oil & gas
* [ ] real estate
* [ ] finance
* [ ] PPT


"AIY","1D1","Q01","C52","C6L","N02","CMOU","J36","MZH","H15"

[-0.07180540383962165, -0.11854125470258896, -0.12648487157652558]
[-0.06418178775910893, -0.11182816112584644, -0.12240917160798877]
[-0.0661536523480504, -0.11712577958031309, -0.12753433422182392]

# LH
* [x] Got 3 banks 20 years dividends yeilds
  * [x] higher than 2.5%
* [x] tax free for dividends
* [ ] Risk & dividends
* [ ] PPT

EB5，WJP，9CI，D05，H02，SJX，Z77，F9D，O39，BVA

[-0.014731072249326526, -0.03472281983573573, -0.027072505203595557]
[-0.01412492485921026, -0.03266493395650299, -0.023181011380279934]
[-0.014468315593586457, -0.03271802342041812, -0.023154489175864344]

# DY
* [x] Calculate sharp ratio of 5 stocks
* [x] SD & average graphs
* [x] Consider dividend

High P/E and market cap: M01,5DD,CC3,i07,BN4

5DD has dividends 0.03
[-0.06111632201073628, -0.05618546971972796, -0.08108709218850965]
5DD has dividends 0.03
[-0.048008977884077035, -0.03774210410452711, -0.05383629233884066]
5DD has dividends 0.03
[-0.0475247316608173, -0.036873609552567854, -0.05264995641854608]

Low P/E and high market cap: L38,E5H,1D0,Z74,CY6U
1D0 has dividends 0.0112
CY6U has dividends 0.0309
[0.04267668911999559, 0.030246313164303165, 0.037334626484502045]
1D0 has dividends 0.0112
CY6U has dividends 0.0309
[0.038387376251497365, 0.026731733733966957, 0.03420773978220032]
1D0 has dividends 0.0112
CY6U has dividends 0.0309
[0.03763797017493092, 0.026161179873087317, 0.03359514945604113]

# TQ
* [ ] Why these stock are re-presentative
* [ ] Confirm volumn unit & re-compare
* [ ] Covid impact
  * [ ] STI
  * [ ] HSI
  * [ ] SPX
5LY,T82U,AWX,U96,S56,CJLU,AP4,S68,A7RU,C09

5LY has dividends 0.001
AP4 has dividends 0.05
A7RU has dividends 0.0096
[-0.017253134487262324, -0.038591393817035524, -0.02659274143763755]
5LY has dividends 0.001
AP4 has dividends 0.05
A7RU has dividends 0.0096
[-0.008653213828856645, -0.032398433375705644, -0.020771501915553416]
5LY has dividends 0.001
AP4 has dividends 0.05
A7RU has dividends 0.0096
[-0.00749224717024272, -0.03127827981006113, -0.01897603562433092]

# WW
* [x] Group stock by sector / industry
  * [x] Calculate returns / Rreturns
  * [x] Calculate beta of CAPM
  * [ ] Calculate Jensen’s Alpha
  * [x] Calculate risk
* [x] Investment Strategry
  * [x] Based on last year
  * [x] Based on last 5 year
  * [x] Based on last 10 year
  * [x] Based on last 20 year
* [x] Evaluate with
  * [x] Jan 2024
  * [x] Feb 2024 onwards

[-0.04073332919096256, 0.00491763519168289, 0.02021827482279764]
[-0.045493267837334234, -0.00018177085977349496, 0.018118946986878277]
[-0.04522771183553662, -0.00014311445898768267, 0.017844134342120396]

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
