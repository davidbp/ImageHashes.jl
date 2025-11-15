```@meta
CurrentModule = ImageHashes
```

# ImageHashes.jl

*ImageHashes.jl* is a Julia package for image hashing. It covers various techniques to simplify
the task of finding **exact** and **near duplicates** in an image collection, among other applications.

## Getting Started

## Benchmark

The package provides basic benchmarks in `benchmarks/benchmark.jl `. One can run 

```
julia --project=. benchmarks/benchmark.jl 
```

to get 

```
BENCHMARK RESULTS
time taken to compute a hash using difference_hash : 1.28e-6 seconds
Hashes per second: 781645
time taken to compute 100000000 hash distances: 0.531 seconds
```

There is an equivalent benchmark in Python using 

```
https://github.com/JohannesBuchner/imagehash
```

which produces 

```
BENCHMARK RESULTS
time taken to compute a hash using dhash: 0.004 seconds
Hashes per second: 250
time taken to compute 100000000 hash distances: 242.927 seconds
```


### Related material to  `ImageHashes`

This Package is inspired by:

```
https://github.com/JohannesBuchner/imagehash
```

Good related material can be found in 
- https://github.com/JohannesBuchner/imagehash
- https://www.hackerfactor.com/blog/index.php?/archives/432-Looks-Like-It.html
- https://erdogant.github.io/undouble/pages/html/hash_functions.html
- https://content-blockchain.org/research/testing-different-image-hash-functions/

```@index

```

```@autodocs
Modules = [ImageHashes]
```
