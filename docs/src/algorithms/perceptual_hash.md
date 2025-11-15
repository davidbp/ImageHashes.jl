```@setup A
using ImageHashes, Images, BenchmarkTools, TestImages
```

# Perceptual Hash (pHash)

Perceptual hashing is based on four steps:

1. Convert the image to grayscale and resize it to `n_size_side_preprocess=32`
1. Compute the DCT of the `32x32` image.
1. Get the top `n_hash=n_size_side*n_size_side` bits of the previous `32x32` array (usually ignoring the first value).
1. Create a hash comparing each value of the previous array with the median.

## Quickstart

A hash (vector hash) for an image can be created with `perceptual_hash` function.

```@repl
using TestImages, ImageHashes
img = testimage("coffee.png");
img_hash = perceptual_hash(img)
typeof(img_hash)
```

## Example

Let us visualize the original image and hash and mathash of an image.

```@example A
using TestImages, Images, ImageHashes
img = testimage("coffee.png")
```

A "perceptual mathash" (matrix hash) can be created using [`perceptual_mathash`](@ref), as follows:

```@repl A
mat_hash = perceptual_mathash(img, 8)
```

We can visualize the hash using `Gray.()`:

```@example A
Gray.(mat_hash)
```

The bigger the matrix hash is, the higher quality it can achive.

```@example A
mat_hash = perceptual_mathash(img, 32)
Gray.(mat_hash)
```

## Performance

```@repl A
img = testimage("coffee.png");
@benchmark perceptual_hash($img, 8)
```
