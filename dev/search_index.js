var documenterSearchIndex = {"docs":
[{"location":"difference_hash/#Difference-Hash","page":"Difference Hash","title":"Difference Hash","text":"","category":"section"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"Difference hashing is based on four steps:","category":"page"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"(1) Reduce size shrinking the image to 9x8 so that there are 72 total pixels. Since we ignore size and aspect ratio, the hash should match any similar picture regardless of how it is stretched.\n(2) Convert the image to grayscale.\n(3) Compute the difference between adjacent pixels, creating the relative gradient direction. When shrinked to 9x8, the 9 pixels per row create 8 differences between adjacent pixels. \n(4) Assign each bits depending on whether the left pixel is brighter than the right pixel. ","category":"page"},{"location":"difference_hash/#Example","page":"Difference Hash","title":"Example","text":"","category":"section"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"Let us visualize the original image and hash and mathash of an image.","category":"page"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"using TestImages\nimg = testimage(\"fabio_color_256.png\");\nimg","category":"page"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"An difference mat hash (matrix hash) can be created using difference_mathash(image, size), as follows:","category":"page"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"using TestImages, Images, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nmat_hash = difference_mathash(img, 8)\nmat_hash","category":"page"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"We can visualize the hash using Gray..","category":"page"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"using TestImages, Images, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nmat_hash = difference_mathash(img, 8)\nGray.(mat_hash)","category":"page"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"The bigger the mat hash is, the higher quality it can achive.","category":"page"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"using TestImages, Images, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nmat_hash = difference_mathash(img, 28)\nGray.(mat_hash)","category":"page"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"A hash (vector hash) for an image can be created with difference_hash function.","category":"page"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"using TestImages, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nimg_hash = difference_hash(img, 8)\nimg_hash","category":"page"},{"location":"difference_hash/#Execution-time-and-allocations","page":"Difference Hash","title":"Execution time and allocations","text":"","category":"section"},{"location":"difference_hash/","page":"Difference Hash","title":"Difference Hash","text":"using TestImages, ImageHashes, BenchmarkTools\nimg = testimage(\"fabio_color_256.png\");\n@benchmark difference_hash($img, 8)","category":"page"},{"location":"perceptual_hash/#Perceptual-Hash","page":"Perceptual Hash","title":"Perceptual Hash","text":"","category":"section"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"Perceptual hashing is based on four steps:","category":"page"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"(1) Convert the image to grayscale and resize it to n_size_side_preprocess=32\n(2) Compute the DCT of the 32x32 image.\n(3) Get the top n_hash=n_size_side*n_size_side bits of the previous 32x32 array (usually ignoring the first value).\n(4) Create a hash comparing each value of the previous array with the median.","category":"page"},{"location":"perceptual_hash/#Example","page":"Perceptual Hash","title":"Example","text":"","category":"section"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"Let us visualize the original image and hash and mathash of an image.","category":"page"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"using TestImages\nimg = testimage(\"fabio_color_256.png\");\nimg","category":"page"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"A \"perceptual mathash\" (matrix hash) can be created using perceptual_mathash(image, n_size_side), as follows:","category":"page"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"using TestImages, Images, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nmat_hash = perceptual_mathash(img, 8)\nmat_hash","category":"page"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"We can visualize the hash using Gray..","category":"page"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"using TestImages, Images, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nmat_hash = perceptual_mathash(img, 8)\nGray.(mat_hash)","category":"page"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"The bigger the matrix hash is, the higher quality it can achive.","category":"page"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"using TestImages, Images, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nmat_hash = perceptual_mathash(img, 28)\nGray.(mat_hash)","category":"page"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"A hash (vector hash) for an image can be created with perceptual_hash function.","category":"page"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"using TestImages, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nimg_hash = perceptual_hash(img, 8)\nimg_hash","category":"page"},{"location":"perceptual_hash/#Execution-time-and-allocations","page":"Perceptual Hash","title":"Execution time and allocations","text":"","category":"section"},{"location":"perceptual_hash/","page":"Perceptual Hash","title":"Perceptual Hash","text":"using TestImages, ImageHashes, BenchmarkTools\nimg = testimage(\"fabio_color_256.png\");\n@benchmark perceptual_hash($img, 8)","category":"page"},{"location":"average_hash/#Average-Hash","page":"Average Hash","title":"Average Hash","text":"","category":"section"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"Average hashing is based on four steps:","category":"page"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"(1) Resize an image to be a squ ared image of height  and width equal to a user defined input n_size_side.\n(2) Construct an matrix  img_resized_gray with the the gray values of the resized image.\n(3) Compute the mean intensity of img_resized_gray and store it to mean_image_intensity.\n(4) Build a matrix that contains a 1 in position k if img_resized_gray[k] >. mean_image_intensity, and a 0 otherwise.","category":"page"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"The average hash vector for an image would be the flattenend matrix of step (4).","category":"page"},{"location":"average_hash/#Example","page":"Average Hash","title":"Example","text":"","category":"section"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"Let us visualize the original image and hash and mathash of an image.","category":"page"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"using TestImages\nimg = testimage(\"fabio_color_256.png\");\nimg","category":"page"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"An average mat hash (matrix hash) can be created using average_hash(image, size), as follows:","category":"page"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"using TestImages, Images, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nmat_hash = average_mathash(img, 8)\nmat_hash","category":"page"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"We can visualize the hash using Gray..","category":"page"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"using TestImages, Images, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nmat_hash = average_mathash(img, 8)\nGray.(mat_hash)","category":"page"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"The bigger the mat hash is, the higher quality it can achive.","category":"page"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"using TestImages, Images, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nmat_hash = average_mathash(img, 28)\nGray.(mat_hash)","category":"page"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"A hash (vector hash) for an image can be created with the average_hash function.","category":"page"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"using TestImages, ImageHashes\nimg = testimage(\"fabio_color_256.png\");\nimg_hash = average_hash(img, 8)\nimg_hash","category":"page"},{"location":"average_hash/#Execution-time-and-allocations","page":"Average Hash","title":"Execution time and allocations","text":"","category":"section"},{"location":"average_hash/","page":"Average Hash","title":"Average Hash","text":"using TestImages, ImageHashes, BenchmarkTools\nimg = testimage(\"fabio_color_256.png\");\n@benchmark average_hash($img, 8)","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"CurrentModule = ImageHashes","category":"page"},{"location":"#ImageHashes-package","page":"Introduction","title":"ImageHashes package","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"ImageHashes.jl is a Julia package for image hashing. It covers various techniques to simplify the task of finding exact and near duplicates in an image collection, among other applications.","category":"page"},{"location":"#Benchmark","page":"Introduction","title":"Benchmark","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"The package provides basic benchmarks in benchmarks/benchmark.jl. One can run ","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"julia --project=. benchmarks/benchmark.jl ","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"to get ","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"BENCHMARK RESULTS\ntime taken to compute a hash: 1.216701e-6 seconds\nHashes per second: 821895\ntime taken to compute 1 billion hash distances: 0.57279325 seconds","category":"page"},{"location":"#Related-material-to-ImageHashes","page":"Introduction","title":"Related material to  ImageHashes","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"This Package is inspired by:","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"https://github.com/JohannesBuchner/imagehash","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"Good related material can be found in ","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"https://github.com/JohannesBuchner/imagehash\nhttps://www.hackerfactor.com/blog/index.php?/archives/432-Looks-Like-It.html\nhttps://erdogant.github.io/undouble/pages/html/hash_functions.html\nhttps://content-blockchain.org/research/testing-different-image-hash-functions/","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"Modules = [ImageHashes]","category":"page"}]
}
