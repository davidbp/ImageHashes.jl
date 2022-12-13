# ImageHashes

[![Documenter](https://github.com/davidbp/ImageHashes.jl/actions/workflows/Documenter.yml/badge.svg)](https://github.com/davidbp/ImageHashes.jl/actions/workflows/Documenter.yml)
[![Runtests](https://github.com/davidbp/ImageHashes.jl/actions/workflows/Runtests.yml/badge.svg)](https://github.com/davidbp/ImageHashes.jl/actions/workflows/Runtests.yml)

ImageHashes implements image hashing algorithms to perform near-duplication detection.


#### Example:

```julia
using TestImages, ImageHashes
img = testimage("fabio_color_256.png");
img_hash = difference_hash(img)
```

Will print
```
0x2f1017d47944000c
```