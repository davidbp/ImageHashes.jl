module DifferenceHash

using Images

export difference_mathash, difference_hash

function preprocess_image(image, n_size_side)
    img_resized = imresize(image, n_size_side + 1, n_size_side)
    img_resized_gray = Gray.(img_resized)
    return img_resized_gray
end

"""
This function simply checks if a given position has lower value than the one in its right
```
bit_matrix = img_resized_gray[:, 2:end] .> mean_image_intensity[:, 1:end-1]
```
"""
function check_rightcol_bigger_than_leftcol(X)
    
    n_rows, n_cols = size(X)
    R = zeros(Bool, n_rows, n_cols)
    
    @inbounds  for j in 1:n_cols-1
        for i in 1:n_rows
            R[i,j] = X[i,j+1].val > X[i,j].val
        end
    end
    return BitMatrix(R)
end

function difference_mathash(image, n_size_side=8)
    img_resized_gray = preprocess_image(image, n_size_side)
    bit_matrix = check_rightcol_bigger_than_leftcol(img_resized_gray)
    return bit_matrix
end

function difference_hash(image, n_size_side=8)
    img_resized_gray = preprocess_image(image, n_size_side)
    hash = reinterpret_bits_as_int_difference_hash(img_resized_gray)
    return hash
end

function reinterpret_bits_as_int_difference_hash(img_resized_gray)

    n_rows, n_cols = size(img_resized_gray)
    n_bits = n_rows * (n_cols-1)

    if n_bits <= 64
        z = zero(UInt64)
    elseif n_bits <= 128
        z = zero(UInt128)
    else
        z = zero(BigInt)
    end

    @inbounds  for j in 1:n_cols-1
        for i in 1:n_rows
            # R[i,j] = X[i,j+1].val > X[i,j].val
            z = (z <<1) | (img_resized_gray[i,j+1].val > img_resized_gray[i,j].val)
        end
    end
    return z
end

function difference_mathash_slow(image, n_size_side=8)
    bit_matrix = difference_mathash(image, n_size_side)
    hash = reinterpret_bits_as_int(bit_matrix)
    return hash
end
end