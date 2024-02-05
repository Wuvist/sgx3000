using CSV
using DataFrames
using Plots
using StatsBase

files = readdir("data/")
tickers = sort([String(split(f, ".")[1]) for f in files if endswith(f, ".csv")])

data = Dict{String,DataFrame}()

for ticker in tickers
    data[ticker] = CSV.read("data/" * ticker * ".csv", DataFrame)
end


function get_cor(t1::String, t2::String)::Float64
    d1 = data[t1]
    d2 = data[t2]

    l1 = size(d1, 1)
    l2 = size(d2, 1)

    v1 = d1."Adj Close"
    v2 = d2."Adj Close"
    if l1 > l2
        v1 = last(v1, l2)
    else
        v2 = last(v2, l1)
    end
    cor(v1, v2)
end

n = size(tickers, 1)
M = fill(0.0, n, n)

for (i, t1) in enumerate(tickers)
    M[i, i] = 0 # hard code cor to self to 0
    for (j, t2) in enumerate(tickers[i+1:end])
        M[i, i+j] = get_cor(t1, t2)
        M[i+j, i] = M[i, i+j]
    end
end

function min_m(m::Matrix{Float64}, min::Float64)::Matrix{Float64}
    n = size(m, 1)
    result = fill(0.0, n, n)
    for i in 1:size(m, 1)
        for j in 1:size(m, 2)
            if m[i, j] > min
                result[i, j] = m[i, j]
            end
        end
    end
    result
end

heatmap(min_m(M, 0.9), fc=cgrad([:white, :dodgerblue4]), xrot=90, yflip=true)
heatmap(M, fc=cgrad([:white, :dodgerblue4]), xrot=90, yflip=true)

function get_impacts(min::Float64)::Dict{String,Int32}
    impacts = Dict{String,Int32}()
    for (i, t) in enumerate(tickers)
        impact = sum(M[i, :] .> min)
        if impact > 0
            impacts[t] = impact
        end
    end
    impacts
end

tops = get_impacts(0.9)

sort(collect(tops), by=x -> x[2])

#  "HSS" => 41
# "A7RU" => 41
#  "CXS" => 42
#  "HST" => 44
#  "SRT" => 46
#  "MZH" => 46
#  "XJB" => 48
#  "49B" => 48
#  "40W" => 49
#  "YYY" => 50
#  "O9E" => 50
#  "42D" => 53
# "P7VU" => 56
#  "RC5" => 57
#  "1D5" => 63
#  "V8Y" => 63
#  "SK3" => 72
#  "OTS" => 76
#  "VI2" => 88
#  "GRN" => 92
#  "PPC" => 94

# UOB APAC Green REIT ETF (GRN.SI)
# ProsperCap Corporation Limited (PPC.SI)
# Trans-China Automotive Holdings Limited (VI2.SI)

heatmap(abs.(M[1:100, 1:100]), fc=cgrad([:white, :dodgerblue4]), xrot=90, yflip=true)
heatmap(abs.(M[240:260, 50:78]), fc=cgrad([:white, :dodgerblue4]))
