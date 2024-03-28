using CSV, DataFrames, Dates, JSON, LinearAlgebra, Plots, PrettyTables
using Printf, Statistics, TimeSeries

function load_price(ticker)::DataFrame
    df = CSV.read("data_latest/" * ticker * ".csv", DataFrame)
    df[:, :Day] = string.(df.Date)
    df
end

function load_dividend(ticker)::DataFrame
    df = CSV.read("data/" * ticker * ".csv", DataFrame)
    df = df[df.Dividends.>0, :]
    day = SubString.(df.Date, 1, 10)
    d = Date.(day)
    select!(df, Not(:Date))
    df[:, :Date] = d
    df[:, :Day] = day
    df
end

struct Stock
    Price::DataFrame
    Dividend::DataFrame
end

function load(ticker)::Stock
    Stock(load_price(ticker), load_dividend(ticker))
end

function get_oprice(backday::String, price::Float64, stock::Stock)::Float64
    df = stock.Dividend

    count = size(df, 1)
    total_adjustment_factor = 1
    for i in count:-1:1
        row = df2[i, :]
        oclose = row.Close / total_adjustment_factor
        adjustment_factor = oclose / (oclose + row.Dividends)
        total_adjustment_factor = total_adjustment_factor * adjustment_factor
    end

    price / total_adjustment_factor
end

function list_dividend(backday::String, stock::Stock)
    df = stock.Dividend[backday.<stock.Dividend.Day, :]
    println("Day,Close,Original Close,Dividends,Adjustment Factor")
    count = size(df, 1)
    total_adjustment_factor = 1
    for i in count:-1:1
        row = df[i, :]
        oclose = row.Close / total_adjustment_factor
        adjustment_factor = oclose / (oclose + row.Dividends)
        total_adjustment_factor = total_adjustment_factor * adjustment_factor
        println(row.Day, ",", row.Close, ",", oclose, ",", row.Dividends, ",", adjustment_factor)
    end
    println("")
    println("total_adjustment_factor: ", total_adjustment_factor)
end

struct StockReturn
    ByAdjClose::Float64
    ByActual::Float64
end

function get_return_diff(r::StockReturn)::Float64
    r.ByAdjClose / r.ByActual - 1
end

function get_return(buy_day, sell_day::String, stock::Stock)::StockReturn
    i = findlast(x -> x <= buy_day, stock.Price.Day)
    if i == nothing
        return StockReturn(NaN, NaN)
    end

    j = findlast(x -> x <= sell_day, stock.Price.Day)
    buy = stock.Price[i, :]
    sell = stock.Price[j, :]
    @printf "Adj Close: buy: %1.6f sell: %1.6f gain: %1.6f\n" buy."Adj Close" sell."Adj Close" (sell."Adj Close" - buy."Adj Close")
    ReturnByAdjClose = sell."Adj Close" / buy."Adj Close" - 1
    df = stock.Dividend
    dividends = sum(df[buy_day.<df.Day.<sell_day, :].Dividends)

    @printf "Dividend: %1.6f\n" dividends
    ByActual = (sell."Close" + dividends) / buy."Close" - 1

    @printf "Actual   : buy: %1.6f sell: %1.6f gain: %1.6f\n" buy."Close" (sell."Close" + dividends) (sell."Close" + dividends - buy."Close")

    StockReturn(ReturnByAdjClose, ByActual)
end

function get_aprice(backday::String, price::Float64, stock::Stock)::Float64
    df = stock.Dividend

    rprice = price
    count = size(df, 1)
    total_adjustment_factor = 1
    for i in count:-1:1
        row = df[i, :]
        oclose = row.Close / total_adjustment_factor
        adjustment_factor = oclose / (oclose + row.Dividends)
        rprice = rprice * adjustment_factor
        total_adjustment_factor = total_adjustment_factor * adjustment_factor
    end

    price * total_adjustment_factor
end

function get_all_tickers()
    tickers = []
    for (ticker, _) in info
        if isfile("data/" * ticker * ".csv")
            push!(tickers, ticker)
        end
    end
    tickers
end

qt = JSON.parsefile("data/quote_table.json")
function get_active()
    data = []
    # @printf("Ticker,Market Cap(M),Avg Volume(SGD)\n")
    for (k, v) in qt
        if haskey(v, "Market Cap") && string(v["Market Cap"]) != "NaN" && v["Avg. Volume"] * v["Open"] > 10000
            mc = v["Market Cap"]
            if endswith(mc, "B")
                mc = parse(Float64, (mc[1:length(mc)-1])) * 1000
            else
                mc = parse(Float64, (mc[1:length(mc)-1]))
            end
            # @printf("%s,%.3f,%.3f\n", k, mc, v["Avg. Volume"] * v["Open"])
            push!(data, k)
        end
    end
    data
end

active_tickers = get_active()
