"""
    difference_mathash(image, n_size_side::Int = 8; orientation = :horizontal)

Compute a `BitMatrix` representing the adjacent–pixel intensity
comparisons used by the difference hash (dHash) algorithm.

# Arguments
- `image`: The input image.
- `n_size_side`: The side length of the final hash matrix (default = `8`).
- `orientation`:
  - `:horizontal`: compare pixels from left to right (default).
  - `:vertical`: compare pixels from top to bottom.

# Returns
A `BitMatrix` where each entry indicates whether the neighboring pixel in the comparison
direction has greater intensity than the current pixel. The `size` of the resulting matrix
depends on provided `orientation`:
- `horizontal`: `(n_size_side + 1, n_size_side)`
- `vertical`: `(n_size_side, n_size_side + 1)`
"""
function difference_mathash(image, n_size_side::Int = 8; orientation::Symbol = :horizontal) :: BitMatrix

    img_resized_gray = if orientation == :horizontal
        _preprocess_image(image, (n_size_side + 1, n_size_side))
    elseif orientation == :vertical
        _preprocess_image(image, (n_size_side, n_size_side + 1))
    else
        throw(ArgumentError("orientation must be :vertical or :horizontal, got $orientation"))
    end

    n_rows, n_cols = size(img_resized_gray)
    R = BitMatrix(undef, n_rows, n_cols)

    @inbounds if orientation == :horizontal
        for i in 1:n_rows-1
            for j in 1:n_cols
                R[i, j] = img_resized_gray[i + 1, j] > img_resized_gray[i, j]
            end
        end
    else
        for i in 1:n_rows
            for j in 1:n_cols-1
                R[i, j] = img_resized_gray[i, j + 1] > img_resized_gray[i, j]
            end
        end
    end
    return R
end


"""
    difference_hash(image, n_size_side::Int = 8; orientation::Symbol = :horizontal)

Compute the ifference hash (dHash) of an image and return it as a compact
integer value.

# Arguments
- `image`: Input image to hash.
- `n_size_side`: Side length of the square region used for hashing (default = `8`, producing a 64-bit hash).
- `orientation`: orientation to apply the difference hash.
  - `:horizontal`: compares pixels from left to right (default).  
  - `:vertical`: compares pixels from top to bottom.

# Returns
A compact integer hash value whose bit pattern corresponds to the dHash
comparison matrix. For `n_size_side = 8`, the result fits in a `UInt64`.
"""
function difference_hash(image, n_size_side::Int = 8; orientation::Symbol = :horizontal)
    bit_matrix = difference_mathash(image, n_size_side; orientation)
    z = init_hash_container(length(bit_matrix))

    @inbounds for b in bit_matrix
        z = (z << 1) | b
    end
    return z
end
