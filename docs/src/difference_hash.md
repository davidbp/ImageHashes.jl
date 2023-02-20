# Difference Hash

Difference hashing is based on four steps:

- (1) Reduce size shrinking the image to 9x8 so that there are 72 total pixels. Since we ignore size and aspect ratio, the hash should match any similar picture regardless of how it is stretched.
- (2) Convert the image to grayscale.
- (3) Compute the difference between adjacent pixels, creating the relative gradient direction. When shrinked to 9x8, the 9 pixels per row create 8 differences between adjacent pixels. 
- (4) Assign each bits depending on whether the left pixel is brighter than the right pixel. 



#### Example

Let us visualize the original image and hash and mathash of an image.

```@example
using TestImages
img = testimage("fabio_color_256.png");
img
```

An difference mat hash (matrix hash) can be created using `difference_mathash(image, size)`, as follows:

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = difference_mathash(img, 8)
mat_hash
```


We can visualize the hash using `Gray.`.

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = difference_mathash(img, 8)
Gray.(mat_hash)
```

The bigger the mat hash is, the higher quality it can achive.

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = difference_mathash(img, 28)
Gray.(mat_hash)
```

A hash (vector hash) for an image can be created with `difference_hash` function.

```@example
using TestImages, ImageHashes
img = testimage("fabio_color_256.png");
img_hash = difference_hash(img, 8)
img_hash
```

#### Execution time and allocations

```@example
using TestImages, ImageHashes, BenchmarkTools
img = testimage("fabio_color_256.png");
@benchmark difference_hash($img, 8)
```
