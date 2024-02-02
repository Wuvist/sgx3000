using CSV
using Plots
using DataFrames
using StatsBase

function pct_change(input::AbstractVector{<:Number})
    [i == 1 ? missing : (input[i] - input[i-1]) / input[i-1] for i in eachindex(input)]
end

function pct_change2(input::AbstractVector{<:Number})
    [(input[i] - input[i-1]) / input[i-1] for i in 2:length(input)]
end

function plot_pacf(ticker::String)
    df = CSV.read("data/" * ticker * ".csv", DataFrame)
    lags = 1:50
    bar_width = 0.4
    x1 = lags .- bar_width
    bar_style = Dict(:linewidth => 0, :bar_width => bar_width)
    returns = pct_change2(values(df."Adj Close"))
    ci = 1.96 / sqrt(length(returns))

    bar(x1, autocor(returns, lags), ; bar_style..., label=ticker * " ACF", color=:grey, ylim=(-0.1, 0.1), size=(1280, 720))
    bar!(pacf(returns, lags), ; bar_style..., label=ticker * " PACF")
    hline!([ci, -ci], color=:black, linestyle=:dash, label="95% CI")
end

function plot_price(ticker::String)
    df = CSV.read("data/" * ticker * ".csv", DataFrame)
    c2 = theme_palette(:auto).colors.colors[2]
    plot(df.Date, pct_change(df."Adj Close"), label=ticker * " Volatility", size=(1280, 720), legend=:top)
    plot!(twinx(), df.Date, df."Adj Close", label=ticker * " Price", size=(1280, 720), color=c2, legend=:bottom)
end
