using ImageHashes
using Documenter

DocMeta.setdocmeta!(ImageHashes, :DocTestSetup, :(using ImageHashes); recursive=true)

makedocs(;
    modules=[ImageHashes],
    authors="David Buchaca Prats <davidbuchaca@gmail.com> and contributors",
    repo="https://github.com/davidbp/ImageHashes.jl/blob/{commit}{path}#{line}",
    sitename="ImageHashes.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://davidbp.github.io/ImageHashes.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/davidbp/ImageHashes.jl",
    devbranch="main",
)
