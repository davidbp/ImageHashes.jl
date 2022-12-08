# ImageHashes

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://davidbp.github.io/ImageHashes.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://davidbp.github.io/ImageHashes.jl/dev/)
[![Build Status](https://github.com/davidbp/ImageHashes.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/davidbp/ImageHashes.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/davidbp/ImageHashes.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/davidbp/ImageHashes.jl)


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