using ImageHashes
using Test
using TestImages

@testset "ImageHashes.jl" begin

@testset "Test Average hash" begin
    img = testimage("fabio_color_512.png");    

    img_h1 = average_mathash(img)
    @test size(img_h1) == (8, 8)
    @test eltype(img_h1) == Bool

    img_h2 = average_mathash(img, 16)
    @test size(img_h2) == (16, 16)
    @test eltype(img_h2) == Bool
end

@testset "Reinterpret iterable of bits as int" begin
    
    expected_types = [UInt64, UInt128, BigInt]
    n_bits_list = [64, 128, 257]

    for (n_bits, expected_type) in zip(n_bits_list, expected_types)
        bitvector = rand(Bool, n_bits)
        result = reinterpret_bits_as_int(bitvector)
        @test eltype(result) == expected_type
    end
end

@testset "Hamming bitwise between ints" begin

    types = [UInt64, UInt128,  BigInt]
    pairs = [(4, 4),  # 0100 0100 --> 0
             (2, 0),  # 0010 0000 --> 1
             (3, 1),  # 0011 0001 --> 1
             (7, 1),  # 0111 0001 --> 2
             ]
    expected_results = [0, 1, 1, 2]

    for t in types
        for (p, expected_result) in zip(pairs, expected_results)
            x, y  = t(p[1]), t(p[2])
            @test expected_result == hamming_bitwise(x, y)
        end
    end
    
end

end
