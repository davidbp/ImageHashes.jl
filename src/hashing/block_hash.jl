function block_mathash(img; hash_size=16)
    gray = Gray.(img)
    resized = imresize(gray, (hash_size, hash_size))
    
    h, w = size(resized)
    mh, mw = h ÷ 2, w ÷ 2
    
    tl = sum(@view resized[1:mh, 1:mw])
    tr = sum(@view resized[1:mh, mw+1:w])
    bl = sum(@view resized[mh+1:h, 1:mw])
    br = sum(@view resized[mh+1:h, mw+1:w])
    
    brightest = argmax([tl, tr, bl, br])
    
    flipped = if brightest == 1
        resized
    elseif brightest == 2
        reverse(resized, dims=2)
    elseif brightest == 3
        reverse(resized, dims=1)
    else
        reverse(reverse(resized, dims=1), dims=2)
    end
    
    med = median(flipped)
    return flipped .> med
end

function block_hash(img; hash_size=16)
    bit_matrix = block_mathash(img; hash_size=hash_size)
    z = init_hash_container(length(bit_matrix))
    for k in eachindex(bit_matrix)
        z = (z << 1) | UInt(bit_matrix[k])
    end
    return z
end
