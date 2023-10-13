module InverseLangevinApproximations

using InteractiveUtils
using DocStringExtensions

export inverse_langevin_approximation

abstract type AbstractInverseLangevinApproximation end

"""
$(TYPEDSIGNATURES)
Method for computing the inverse Langevin function.
- `y`: The value of the Langevin Function
- `m`: The approximation Method
"""
@inline function inverse_langevin_approximation(y, m::AbstractInverseLangevinApproximation)
    error("Method is not implemented for $m")
end

Base.broadcastable(o::AbstractInverseLangevinApproximation) = Ref(o)

include("approximations.jl")

export CohenRounded3_2,
    CohenExact3_2,
    PadeApproximation3_2,
    PusoApproximation,
    TreloarApproximation,
    WarnerApproximation,
    KuhnGrunApproximation,
    BergstromApproximation,
    PadeApproximation_1_4,
    PadeApproximation_1_2,
    PadeApproximation_5_0,
    PadeApproximation_3_0,
    Jedynak2017,
    NguessongBedaPeyraut,
    DarabiItskov

end
