```@meta
CurrentModule = InverseLangevinApproximations
```

# InverseLangevinApproximations

A Julia package for approximating the inverse of the Langevin function, ℒ.

```math
\mathcal{L}(x) = \coth(x) - \frac{1}{x}
```

```@eval
using Plots
using InteractiveUtils
using InverseLangevinApproximations
using Markdown
L(x) = x==zero(x) ? 0 : coth(x) - 1/x
x_true = range(0.0, 10.0, length = 101)
y = L.(x_true)
use_model(x) = Base.isexported(InverseLangevinApproximations, Symbol(x))
fs = filter(use_model, subtypes(InverseLangevinApproximations.AbstractInverseLangevinApproximation))
p = plot(xlabel = "y", ylabel = "Relative Error")
for f in fs
    x = inverse_langevin_approximation.(f(), y)
    rel_error = abs.((x .- x_true) ./ x_true)
    plot!(p, y, rel_error, label = string(f))
end
savefig(p ,"example.png")
Markdown.parse("![example](example.png)")
```
