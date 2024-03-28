using CSV, DataFrames, Dates, JSON, LinearAlgebra, MarketData, Plots, PrettyTables
using Printf, Statistics, TimeSeries

function load(ticker)
    df = CSV.read("data/" * ticker * ".csv", DataFrame)
    day = SubString.(df.Date, 1, 10)
    d = Date.(day)
    select!(df, Not(:Date))
    df[:, :Date] = d
    df[:, :Day] = day
    df
end

function load2024(ticker)
    df = CSV.read("data/2024/" * ticker * ".csv", DataFrame)
    day = SubString.(df.Date, 1, 10)
    d = Date.(day)
    select!(df, Not(:Date))
    df[:, :Date] = d
    df[:, :Day] = day
    df
end

