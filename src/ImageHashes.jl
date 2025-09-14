module ImageHashes

using Images
using Statistics
using FFTW

include("utils.jl")
include("distances.jl")
include("hashing/average.jl")
include("hashing/difference.jl")
include("hashing/perceptual.jl")

export average_hash
export average_mathash
export difference_hash
export difference_mathash
export perceptual_hash
export perceptual_mathash
export hamming_bitwise
export reinterpret_bits_as_int

end
