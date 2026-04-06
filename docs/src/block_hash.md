# Block Hash

Block hashing is based on five steps:

- (1) Resize an image to be a squared image of height and width equal to a user defined input `hash_size`.
- (2) Construct a matrix `img_resized_gray` with the gray values of the resized image.
- (3) Split the image into 4 quadrants and determine which quadrant has the highest total brightness.
- (4) Flip the image horizontally and/or vertically so that the brightest quadrant ends up in the top-left.
- (5) Compute the median intensity of the flipped image and build a matrix that contains a `1` in position `k` if `flipped[k] > median`, and a `0` otherwise.

The block hash vector for an image would be the flattened matrix of step (5).

#### Example

Let us visualize the original image and hash and mathash of an image.

```@example
using TestImages
img = testimage("fabio_color_256.png");
img
```

A block mat hash (matrix hash) can be created using `block_mathash(image, hash_size)`, as follows:

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = block_mathash(img, hash_size=8)
mat_hash
```

We can visualize the hash using `Gray.`.

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = block_mathash(img, hash_size=8)
Gray.(mat_hash)
```

The bigger the mat hash is, the higher quality it can achieve.

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = block_mathash(img, hash_size=28)
Gray.(mat_hash)
```

A hash (vector hash) for an image can be created with the `block_hash` function.

```@example
using TestImages, ImageHashes
img = testimage("fabio_color_256.png");
img_hash = block_hash(img, hash_size=8)
img_hash
```

#### Execution time and allocations

```@example
using TestImages, ImageHashes, BenchmarkTools
img = testimage("fabio_color_256.png");
benchmark = @benchmark block_hash($img, hash_size=8)
benchmark
```
