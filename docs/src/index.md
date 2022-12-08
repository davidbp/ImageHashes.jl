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
time taken to compute a hash: 1.216701e-6 seconds
Hashes per second: 821895
time taken to compute 1 billion hash distances: 0.57279325 seconds
```


### Related material to  `ImageHashes`

This Package is inspired by:

```
https://github.com/JohannesBuchner/imagehash
```

Good related material can be found in 
- https://github.com/JohannesBuchner/imagehash
- https://www.hackerfactor.com/blog/index.php?/archives/432-Looks-Like-It.html

```@index

```

```@autodocs
Modules = [ImageHashes]
```


