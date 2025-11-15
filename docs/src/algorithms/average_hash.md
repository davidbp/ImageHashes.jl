```@setup A
using ImageHashes, Images, BenchmarkTools, TestImages
```

# Average Hash (aHash)

Average hashing is based on four steps:

1. Resize an image to be a squ ared image of height  and width equal to a user defined input `n_size_side`.
1. Construct an matrix  `img_resized_gray` with the the gray values of the resized image.
1. Compute the mean intensity of `img_resized_gray` and store it to `mean_image_intensity`.
1. Build a matrix that contains a `1` in position `k` if `img_resized_gray[k] >. mean_image_intensity`, and a `0` otherwise.

The average hash vector for an image would be the flattenend matrix of step (4).

## Quickstart

A hash (vector hash) for an image can be created with the `average_hash` function.

```@repl
using TestImages, ImageHashes
img = testimage("coffee.png");
img_hash = average_hash(img)
typeof(img_hash)
```

# Example

Let us visualize the original image and hash and mathash of an image.

```@example A
using TestImages, Images, ImageHashes
img = testimage("coffee.png")
```

An average mat hash (matrix hash) can be created using `average_hash(image, size)`, as follows:

```@repl A
mat_hash = average_mathash(img, 8)
```

We can visualize the hash using `Gray.()`:

```@example A
Gray.(mat_hash)
```

The bigger the matrix hash is, the higher quality it can achive.

```@example A
mat_hash = average_mathash(img, 32)
Gray.(mat_hash)
```

## Performance

```@repl A
img = testimage("coffee.png");
@benchmark average_hash($img, 8)
```
