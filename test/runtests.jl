using InverseLangevinApproximations
using Test
using InteractiveUtils


@testset "InverseLangevinApproximations.jl" begin
    use_model(x) = Base.isexported(InverseLangevinApproximations, Symbol(x))
    fs = filter(use_model, subtypes(InverseLangevinApproximations.AbstractInverseLangevinApproximation))
    for f in fs
        @test f() isa InverseLangevinApproximations.AbstractInverseLangevinApproximation
        @test inverse_langevin_approximation(f(), 0.0) ≈ 0.0
    end
end
