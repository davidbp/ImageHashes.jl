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


"""
    init_hash_container(n_bits::Int)

Choose the proper variable type for the variable storing the resulting hash based on `n_bits` of
the input..
"""
function init_hash_container(n_bits::Int)
    type = if n_bits <= 64
        UInt64
    elseif n_bits <= 128
        UInt128
    else
        BigInt
    end
    return zero(type)
end


"""
    _preprocess_image(image, size::Union{Int,Tuple{Int,Int}}; func=nothing)

Resize an image to the target `size` and convert it to grayscale.

# Arguments

- `image`: the input image.
- `size`: either an `Int` (resized to `(size, size)`) or a tuple `(height, width)`.
- `func`: optional function applied on the grayscale image. If provided,
  the function output is returned together with the grayscale image.

# Returns

- If `func` is `nothing`: the resized grayscale image.
- Otherwise: a tuple `(img_resized_gray, func(img_resized_gray))`.
"""
function _preprocess_image(image, size::Union{Int, Tuple{Int, Int}}; func::Union{Function, Nothing} = nothing)
    target_size = size isa Int ? (size, size) : size
    img_resized = imresize(image, target_size)
    img_resized_gray = Gray.(img_resized)

    if isnothing(func)
        return img_resized_gray
    else
        image_intensity = func(img_resized_gray)
        return img_resized_gray, image_intensity
    end
end
