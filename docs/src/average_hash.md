# Average Hash

Average hashing is based on four steps:

- (1) Resize an image to be a squ ared image of height  and width equal to a user defined input `n_size_side`.
- (2) Construct an matrix  `img_resized_gray` with the the gray values of the resized image.
- (3) Compute the mean intensity of `img_resized_gray` and store it to `mean_image_intensity`.
- (4) Build a matrix that contains a `1` in position `k` if `img_resized_gray[k] >. mean_image_intensity`, and a `0` otherwise.

The average hash vector for an image would be the flattenend matrix of step (4).

#### Example

Let us visualize the original image and hash and mathash of an image.

```@example
using TestImages
img = testimage("fabio_color_256.png");
img
```

An average mat hash (matrix hash) can be created using `average_hash(image, size)`, as follows:

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = average_mathash(img, 8)
mat_hash
```


We can visualize the hash using `Gray.`.

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = average_mathash(img, 8)
Gray.(mat_hash)
```

The bigger the mat hash is, the higher quality it can achive.

```@example
using TestImages, Images, ImageHashes
img = testimage("fabio_color_256.png");
mat_hash = average_mathash(img, 28)
Gray.(mat_hash)
```

A hash (vector hash) for an image can be created with

```@example
using TestImages, ImageHashes
img = testimage("fabio_color_256.png");
img_hash = average_hash(img, 8)
img_hash
```
