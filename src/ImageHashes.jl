module ImageHashes

    using Statistics

    ## exports
    export 

    # hash.jl
    average_hash, average_mathash,

    # difference_hashing.jl
    difference_hash, difference_mathash,
    
    # difference_hashing.jl
    perceptual_hash, perceptual_mathash,
    
    # distances.jl
    hamming_bitwise,

    # utils.jl
    reinterpret_bits_as_int

    ## source files
    include("average_hash.jl")
    using .AverageHash

    include("difference_hash.jl")
    using .DifferenceHash

    include("perceptual_hash.jl")
    using .PerceptualHash

    include("distances.jl")

    include("utils.jl")

end # module ImageHashes
