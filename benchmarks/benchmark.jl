using ImageHashes
using Images
using BenchmarkTools

paths = readdir(joinpath(expanduser("~"),
                "Datasets/ecommerce_product_images/Footwear/Men/Images/images_with_product_ids"), 
                join=true);

## How many pairwise comparisons could we do with hashes of 64 bits ? 
function compute_distances(q, database)
    results = Array{UInt8, 1}(undef, length(database))
    for (k,x) in enumerate(database)
        results[k] = hamming_bitwise(x, q)
    end
    return results
end 

images = [load(p) for p in paths];
n_examples = 100_000_000
database = rand(UInt64, n_examples);

# Benchmark hash creation
hash_method = difference_hash
benchmark_hash = @benchmark hash_method($images[1])
time_per_hash_computation_sec = mean(benchmark_hash.times) * 1e-9
hashes_per_second =  Int(round(1/time_per_hash_computation_sec))

# Benchmark distance computation
q = database[6534]
benchmark_compute_distances = @benchmark compute_distances($q, $database)
sec_n_examples_distances = mean(benchmark_compute_distances.times)/n_examples

println("\nBENCHMARK RESULTS")
println("time taken to compute a hash using $(hash_method) : $(round(time_per_hash_computation_sec,digits=8)) seconds")
println("Hashes per second: $hashes_per_second")
println("time taken to compute $(n_examples) hash distances: $(round(sec_n_examples_distances,digits=3)) seconds")

