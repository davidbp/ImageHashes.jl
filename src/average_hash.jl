module AverageHash

using Images
using Statistics

export average_mathash, average_hash


function preprocess_image(image, n_size_side)
    img_resized = imresize(image, n_size_side, n_size_side)
    img_resized_gray = Gray.(img_resized)
    mean_image_intensity = mean(img_resized_gray).val
    return img_resized_gray, mean_image_intensity
end

function average_mathash(image, n_size_side=8)
    img_resized_gray, mean_image_intensity = preprocess_image(image, n_size_side)
    bit_matrix = img_resized_gray .> mean_image_intensity
    return bit_matrix
end

function average_hash(image, n_size_side=8)
    img_resized_gray, mean_image_intensity = preprocess_image(image, n_size_side)
    hash = reinterpret_bits_as_int_average_hash(img_resized_gray, mean_image_intensity)
    return hash
end

function reinterpret_bits_as_int_average_hash(img_resized_gray, mean_image_intensity)

    n_bits = length(img_resized_gray)

    if n_bits <= 64
        z = zero(UInt64)
    elseif n_bits <= 128
        z = zero(UInt128)
    else
        z = zero(BigInt)
    end

    for k in eachindex(img_resized_gray)
        z = (z <<1) | (img_resized_gray[k] > mean_image_intensity)
    end
    return z
end

function average_hash_slow(image, n_size_side=8)
    bit_matrix = average_mathash(image, n_size_side)
    hash = reinterpret_bits_as_int(bit_matrix)
    return hash
end
end