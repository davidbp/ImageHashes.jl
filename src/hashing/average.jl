function average_mathash(image, n_size_side::Int = 8)
    img_resized_gray, mean_image_intensity = _preprocess_image(image, n_size_side, func=mean)
    bit_matrix = img_resized_gray .> mean_image_intensity
    return bit_matrix
end


function average_hash(image, n_size_side::Int = 8)
    img_resized_gray, mean_image_intensity = _preprocess_image(image, n_size_side, func=mean)
    hash = _reinterpret_bits_as_int_average_hash(img_resized_gray, mean_image_intensity)
    return hash
end


function _reinterpret_bits_as_int_average_hash(img_resized_gray, mean_image_intensity)
    n_bits = length(img_resized_gray)
    z = init_hash_container(n_bits)

    for k in eachindex(img_resized_gray)
        z = (z << 1) | UInt(img_resized_gray[k] > mean_image_intensity)
    end
    return z
end
