"""
    average_mathash(image, n_size_side::Int = 8)

Compute the average hash (aHash) of an image and return its bit matrix form.

# Arguments
- `image`: Input image
- `n_size_side`: Size of the resized square image (default = `8`).

# Returns
A `BitMatrix` of size `n_size_side × n_size_side` representing the perceptual bit
pattern of the image.
"""
function average_mathash(image, n_size_side::Int = 8) :: BitMatrix
    img_resized_gray, mean_image_intensity = _preprocess_image(image, n_size_side, func=mean)
    bit_matrix = img_resized_gray .> mean_image_intensity
    return bit_matrix
end


"""
    average_hash(image, n_size_side::Int = 8)

Compute the average hash (aHash) of an image and return it as an integer.

# Arguments
- `image`: The input image, in any format supported by `_preprocess_image`.
- `n_size_side`: The side length of the resized square used for hashing
  (default is `8`, producing a 64-bit hash).

# Returns
An integer representing the average-hash bit pattern. For `n_size_side = 8`,
this will fit in a `UInt64` and can be used for fast similarity comparisons.
"""
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
