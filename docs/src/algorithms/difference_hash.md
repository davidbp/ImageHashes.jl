```@setup A
using ImageHashes, Images, BenchmarkTools, TestImages
```

# Difference Hash (dHash)

Difference hashing is based on four steps:

1. Reduce size shrinking the image to 9x8 so that there are 72 total pixels. Since we ignore size and aspect ratio, the hash should match any similar picture regardless of how it is stretched.
1. Convert the image to grayscale.
1. Compute the difference between adjacent pixels, creating the relative gradient direction. When shrinked to 9x8, the 9 pixels per row create 8 differences between adjacent pixels. 
1. Assign each bits depending on whether the left pixel is brighter than the right pixel. 

## Quickstart

```@repl
using TestImages, ImageHashes
img = testimage("coffee.png");
img_hash = difference_hash(img, 8)
typeof(img_hash)
```

## Example

Let us visualize the original image and hash and mathash of an image.

```@example A
using TestImages, Images, ImageHashes
img = testimage("coffee.png")
```

An difference mat hash (matrix hash) can be created using `difference_mathash(image, size)`, as follows:

```@repl A
mat_hash = difference_mathash(img, 8)
```

We can visualize the hash using `Gray.()`.

```@example A
Gray.(mat_hash)
```

The bigger the matrix hash is, the higher quality it can achive.

```@example A
mat_hash = difference_mathash(img, 32)
Gray.(mat_hash)
```

## Performance

```@repl A
img = testimage("coffee.png");
@benchmark difference_mathash($img, 8)
```
