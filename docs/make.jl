using Pkg
using Documenter
using ImageHashes


makedocs(;
    warnonly=true,
    modules=[ImageHashes],
    sitename="ImageHashes.jl",
    authors="David Buchaca Prats <davidbuchaca@gmail.com> and contributors",
    pages=[
         "Introduction" => "index.md",
         "Hashing Algorithms" => [
             "algorithms/average_hash.md",
             "algorithms/difference_hash.md",
             "algorithms/perceptual_hash.md"
         ],
         "API Reference" => "api.md",
    ],
)


deploydocs(;
    repo="github.com/davidbp/ImageHashes.jl.git"
)
