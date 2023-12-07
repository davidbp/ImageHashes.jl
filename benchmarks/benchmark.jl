using ImageHashes
using Images
using BenchmarkTools

paths = readdir(joinpath(expanduser("~"),
                "Datasets/ecommerce_product_images/Footwear/Men/Images/images_with_product_ids"), 
                join=true);

images = [load(p) for p in paths];

## How many image hashes can we get in one second ?
benchmark_perceptual_hash = @benchmark perceptual_hash(images[1])
seconds_hash_computation = median(benchmark_perceptual_hash.times)/1_000_000_000
hashes_per_second =  Int(round(1/seconds_hash_computation))

## How many pairwise comparisons could we do with hashes of 64 bits ? 
function compute_distances(q, database)
    results = Array{UInt8, 1}(undef, length(database))
    for (k,x) in enumerate(database)
        results[k] = hamming_bitwise(x, q)
    end
    return results
end 

n_examples = 100_000_000
database = rand(UInt64, n_examples);
q = database[6534]
benchmark_compute_distances = @benchmark compute_distances($q, $database)
sec_1billion_distances = mean(benchmark_compute_distances.times)/n_examples

println("\nBENCHMARK RESULTS")
println("time taken to compute a hash: $seconds_hash_computation seconds")
println("Hashes per second: $hashes_per_second")
println("time taken to compute $(n_examples)  hash distances: $sec_1billion_distances seconds")

