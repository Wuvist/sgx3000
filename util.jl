function pct_change(input::AbstractVector{<:Number})
    [i == 1 ? missing : (input[i]-input[i-1])/input[i-1] for i in eachindex(input)]
end
