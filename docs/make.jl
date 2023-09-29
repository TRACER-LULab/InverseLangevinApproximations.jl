using InverseLangevinApproximations
using Documenter
using DocumenterCitations

bib = CitationBibliography(
    joinpath(@__DIR__, "src", "refs.bib");
    style=:numeric
)

DocMeta.setdocmeta!(InverseLangevinApproximations, :DocTestSetup, :(using InverseLangevinApproximations); recursive=true)

makedocs(;
    plugins = [bib],
    modules=[InverseLangevinApproximations],
    authors="Carson Farmer <59753859+cfarm6@users.noreply.github.com> and contributors",
    # repo="https://github.com/TRACER-LULab/InverseLangevinApproximations.jl/blob/{commit}{path}#{line}",
    sitename="InverseLangevinApproximations.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://TRACER-LULab.github.io/InverseLangevinApproximations.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Approximations" => "methods.md"
    ],
)

deploydocs(;
    repo="github.com/TRACER-LULab/InverseLangevinApproximations.jl",
    devbranch="main",
)
