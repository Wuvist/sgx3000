function pct_change(input::AbstractVector{<:Number})
    [i == 1 ? missing : (input[i] - input[i-1]) / input[i-1] for i in eachindex(input)]
end

function pct_change2(input::AbstractVector{<:Number})
    [(input[i] - input[i-1]) / input[i-1] for i in 2:length(input)]
end
