"""
    _difference_hash_matrix(image, n_size_side::Int; orientation=:vertical)

Compute the boolean bit matrix for difference hash.

- `orientation = :vertical`: compares columns (resize to `(n_size_side, n_size_side+1)`), result `(n_size_side, n_size_side)`.
- `orientation = :horizontal`:  compares rows (resize to `(n_size_side+1, n_size_side)`), result `(n_size_side, n_size_side)`.
"""
function _difference_hash_matrix(image, n_size_side::Int; orientation::Symbol = :horizontal)

    img_resized_gray = if orientation == :horizontal
        _preprocess_image(image, (n_size_side + 1, n_size_side))
    elseif orientation == :vertical
        _preprocess_image(image, (n_size_side, n_size_side + 1))
    else
        throw(ArgumentError("orientation must be :vertical or :horizontal"))
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
    z = init_hash_container(length(bit_matrix))

    @inbounds for b in bit_matrix
        z = (z << 1) | b
    end
    return z
end
