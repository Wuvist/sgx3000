using CSV, Plots
using DataFrames
using StatsBase

include("util.jl")

df = CSV.read("STI.csv", DataFrame)

plot(df.Date, pct_change(df."Adj Close"), label="Straits Times Index Volatility", size=(1280, 720))
savefig("STI.png")

lags = 1:50
bar_width = 0.4
x1 = lags .- bar_width
bar_style = Dict(:linewidth => 0, :bar_width => bar_width)
sti = values(df."Adj Close")
sti_ci = 1.96 / sqrt(length(sti))

bar(x1, autocor(sti, lags), ; bar_style..., label="STI ACF", color=:grey, ylim=(-1, 1), size=(1280, 720))
bar!(pacf(sti, lags), ; bar_style..., label="STI PACF")
hline!([sti_ci, -sti_ci], color=:black, linestyle=:dash, label="95% CI")
savefig("STI_pacf.png")
