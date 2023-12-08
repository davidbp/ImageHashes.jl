# Perceptual Hash

Perceptual hashing is based on four steps:

- (1) Convert the image to grayscale and resize it to `n_size_side_preprocess=32`
- (2) Compute the DCT of the `32x32` image.
- (3) Get the top `n_hash=n_size_side*n_size_side` bits of the previous `32x32` array (usually ignoring the first value).
- (4) Create a hash comparing each value of the previous array with the median.


#### Example

Let us visualize the original image and hash and mathash of an image.

```@example
using TestImages
img = testimage("fabio_color_256.png");
img
```

A "perceptual mathash" (matrix hash) can be created using `perceptual_mathash(image, n_size_side)`, as follows:

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = perceptual_mathash(img, 8)
mat_hash
```


We can visualize the hash using `Gray.`.

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = perceptual_mathash(img, 8)
Gray.(mat_hash)
```

The bigger the matrix hash is, the higher quality it can achive.

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = perceptual_mathash(img, 28)
Gray.(mat_hash)
```

A hash (vector hash) for an image can be created with `perceptual_hash` function.

```@example
using TestImages, ImageHashes
img = testimage("fabio_color_256.png");
img_hash = perceptual_hash(img, 8)
img_hash
```


#### Execution time and allocations

```@example
using TestImages, ImageHashes, BenchmarkTools
img = testimage("fabio_color_256.png");
benchmark = @benchmark perceptual_hash($img, 8)
benchmark
```

