using MultiDocumenter

clonedir = mktempdir()

docs = [
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, "QuantumPropagators"),
            path = "quantumpropagators",
            name = "QuantumPropagators",
            giturl = "https://github.com/JuliaQuantumControl/QuantumPropagators.jl.git",
        ),
        MultiDocumenter.MultiDocRef(
            upstream = joinpath(clonedir, "QuantumControl"),
            path = "quantumcontrol",
            name = "QuantumControl",
            giturl = "https://github.com/JuliaQuantumControl/QuantumControl.jl.git",
        ),
]

outpath = joinpath(@__DIR__, "out")

MultiDocumenter.make(
    outpath,
    docs;
    search_engine = MultiDocumenter.SearchConfig(
        index_versions = ["stable"],
        engine = MultiDocumenter.FlexSearch
    )
)
