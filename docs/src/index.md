```@meta
CurrentModule = ImageHashes
```

# ImageHashes package

*ImageHashes.jl* is a Julia package for image hashing.
It covers various techniques to simplify the task of finding **exact** and **near duplicates** in an image collection, among other applications.


### Benchmark

The package provides basic benchmarks in `benchmarks/benchmark.jl `. One can run 

```
julia --project=. benchmarks/benchmark.jl 
```

to get 

```
BENCHMARK RESULTS
time taken to compute a hash: 8.4834e-5 seconds
Hashes per second: 11788
time taken to compute 100000000  hash distances: 0.53851791 seconds
```

There is an equivalent benchmark in Python using 

```
https://github.com/JohannesBuchner/imagehash
```

which produces 

```
BENCHMARK RESULTS
time taken to compute a hash: 0.010337230000000001 seconds
Hashes per second: 97
time taken to compute 100000000 hamming hash distances : 238.037 seconds
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


