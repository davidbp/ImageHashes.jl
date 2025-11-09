function perceptual_mathash(image, n_size_side=8; n_size_side_preprocess=32)
    img_resized_gray, median_image_intensity = _preprocess_image(image, n_size_side_preprocess, func=median)
    dct_image = dct(dct(Float32.(channelview(img_resized_gray)),1),2);
    # option 1) Take the first `n_size_side * n_size_side`` values
    bit_matrix = dct_image[1:n_size_side, 1:n_size_side] .> median_image_intensity
    # option 2) Remove first term of dct
    #bit_matrix = dct_image[1:n_size_side, 2:n_size_side+1] .> median_image_intensity
    return bit_matrix
end

function perceptual_hash(image, n_size_side=8)
    img_resized_gray, median_image_intensity = _preprocess_image(image, 32, func=median)
    #dct_image = dct(dct(reinterpret(UInt8, img_resized_gray),1),2);
    dct_image = dct(dct(Float32.(channelview(img_resized_gray)), 1), 2);
    # Option 1)
    dct_image_top_n_hash = view(dct_image, 1:n_size_side, 1:n_size_side)
    hash = reinterpret_bits_as_int_perceptual_hash(dct_image_top_n_hash, median_image_intensity)
    # Option 2)
    #dct_image_view = view(dct_image,1:n_size_side, 2:n_size_side+1)
    #dct_image_top_n_hash = dct_image[1:n_size_side, 2:n_size_side+1]
    #hash = reinterpret_bits_as_int_perceptual_hash(dct_image_top_n_hash, median_image_intensity)
    return hash
end

function reinterpret_bits_as_int_perceptual_hash(img_resized_gray, median_image_intensity)
    n_bits = length(img_resized_gray)
    z = init_hash_container(n_bits)

    for k in eachindex(img_resized_gray)
        z = (z << 1) | UInt(img_resized_gray[k] > median_image_intensity)
    end
    return z
end
