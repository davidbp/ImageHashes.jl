module ImageHashes

    using Statistics

    # Good reference package https://github.com/JohannesBuchner/imagehash
    # Good material https://www.hackerfactor.com/blog/index.php?/archives/432-Looks-Like-It.html

    ## exports
    export 

    # hash.jl
    average_hash, average_mathash,

    # distances.jl
    hamming_bitwise,

    # utils.jl
    reinterpret_bits_as_int

    ## source files
    include("hash.jl")
    
    include("distances.jl")

    include("utils.jl")

end # module ImageHashes
