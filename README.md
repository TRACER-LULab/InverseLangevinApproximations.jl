# InverseLangevinApproximations

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://tracer-lulab.github.io/InverseLangevinApproximations.jl/stable/) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://tracer-lulab.github.io/InverseLangevinApproximations.jl/dev/)

`InverseLangevinApproximations.jl` is a library for utilizing different approximation of the inverse of the Langevin function, ℒ. The approximations are primarily used in polymer mechanics; however, due to the potential use of the function in other areas of physics, the library is not limited to polymer mechanics.

## API

All approximations are subtypes of `AbstractInverseLangevinApproximation`. Accessing the inverse of the Langevin function is done by calling `inverse_langevin_approximation` with the approximation type as the first argument and the value to approximate as the second argument.

```julia
y = 0.5
x = inverse_langevin_approximation(CohenRounded3_2(), y)
```

## Citing

See [`CITATION.bib`](CITATION.bib) for the relevant reference(s).
