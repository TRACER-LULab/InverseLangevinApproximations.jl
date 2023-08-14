```@meta
CurrentModule = InverseLangevinApproximations
```

# InverseLangevinApproximations

Documentation for [InverseLangevinApproximations](https://github.com/cfarm6/InverseLangevinApproximations.jl).

Generate an example with Documenter.jl to create a plot from 0 to 1 comparing the results of calling inverse_langevin_approximation for all subtypes of AbstractInverseLangevinApproximatioon from InverseLangevinApproxmations.

```@example
using Plots
using InteractiveUtils
using InverseLangevinApproximations
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

savefig("example.png")
nothing
```

![](example.png)