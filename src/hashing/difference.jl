"""
    _difference_hash_matrix(image, n_size_side::Int; orientation=:vertical)

Compute the boolean bit matrix for difference hash.

- `orientation = :vertical`: compares columns (resize to `(n_size_side, n_size_side+1)`), result `(n_size_side, n_size_side)`.
- `orientation = :horizontal`:  compares rows (resize to `(n_size_side+1, n_size_side)`), result `(n_size_side, n_size_side)`.
"""
function _difference_hash_matrix(image, n_size_side::Int; orientation::Symbol = :horizontal)
    if orientation == :horizontal
        img_resized_gray = _preprocess_image(image, (n_size_side + 1, n_size_side)) # compare rows → resize (n+1, n)
        n_rows, n_cols = size(img_resized_gray)
        R = falses(n_rows, n_cols)

        @inbounds for i in 1:n_rows-1
            for j in 1:n_cols
                R[i, j] = img_resized_gray[i + 1, j] > img_resized_gray[i, j]
            end
        end
    elseif orientation == :vertical
        img_resized_gray = _preprocess_image(image, (n_size_side, n_size_side + 1)) # compare cols → resize (n, n+1)
        n_rows, n_cols = size(img_resized_gray)
        R = falses(n_rows, n_cols)

        @inbounds for i in 1:n_rows
            for j in 1:n_cols-1
                R[i, j] = img_resized_gray[i, j + 1] > img_resized_gray[i, j]
            end
        end
    else
        throw(ArgumentError("orientation must be :vertical or :horizontal"))
    end
    return BitMatrix(R)
end


"""
    difference_mathash(image, n_size_side::Int=8; orientation=:horizontal)

Return the difference hash as a `BitMatrix`.

- By default, uses `orientation=:horizontal` to match test expectations.
"""
difference_mathash(image, n_size_side::Int = 8; orientation::Symbol = :horizontal) =
    _difference_hash_matrix(image, n_size_side; orientation)


"""
    difference_hash(image, n_size_side::Int=8; orientation=:horizontal)

Return the difference hash as a compact integer.
"""
function difference_hash(image, n_size_side::Int = 8; orientation::Symbol = :horizontal)
    bit_matrix = _difference_hash_matrix(image, n_size_side; orientation)
    n_bits = length(bit_matrix)
    z = init_hash_container(n_bits)

    @inbounds for b in bit_matrix
        z = (z << 1) | UInt(b)
    end
    return z
end
