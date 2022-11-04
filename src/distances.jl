
hamming_bitwise(x::Union{UInt, UInt128, BigInt}, y::Union{UInt, UInt128, BigInt}) = count_ones(x ⊻ y)
