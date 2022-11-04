

function reinterpret_bits_as_int(iterable_of_bits)

    n_bits = length(iterable_of_bits)

    if n_bits <= 64
        z = zero(UInt64)
    elseif n_bits <= 128
        z = zero(UInt128)
    else
        z = zero(BigInt)
    end

    for k in eachindex(iterable_of_bits)
        z = (z <<1) | iterable_of_bits[k]
    end
    return z
end
