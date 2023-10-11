```@meta
CurrentModule = InverseLangevinApproximations
```

# InverseLangevinApproximations

A Julia package for approximating the inverse of the Langevin function, ℒ.

```math
\mathcal{L}(x) = \coth(x) - \frac{1}{x}
```

```@example
using CairoMakie
using InteractiveUtils
using InverseLangevinApproximations
using Markdown # hide
L(x) = x==zero(x) ? 0 : coth(x) - 1/x
x_true = range(0.0, 10.0, length = 101)
y = L.(x_true)
use_model(x) = Base.isexported(InverseLangevinApproximations, Symbol(x))
fs = filter(use_model, subtypes(InverseLangevinApproximations.AbstractInverseLangevinApproximation))
f = Figure(resolution = (1000, 1000))
ax = Axis(f[1, 1], xlabel = "y", ylabel = "Relative Error", xticks = 0:0.2:1.0)
for f in fs
    x = inverse_langevin_approximation.(f(), y)
    rel_error = abs.((x .- x_true) ./ x_true)
    lines!(ax, y, rel_error, label = string(f))
end
axislegend(position = :lt)
save("example.png", f) # hide
Markdown.parse("![example](example.png)") # hide
```
