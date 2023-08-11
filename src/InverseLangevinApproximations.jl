module InverseLangevinApproximations

export CohenRounded3_2, CohenExact3_2, PusoApproximation, TreloarApproximation, WarnerApproximation, KuhnGrunApproximation, BergstromApproximation, PadeApproximation_1_4, PadeApproximation_1_2, PadeApproximation_5_0, PadeApproximation_3_0, Jedynak2017,PadeApproximation3_2, ArrudaApproximation, inverse_langevin_approximation

abstract type AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(m::AbstractInverseLangevinApproximation, y)
    error("Method is not implemented for $m")
end

include("approximations.jl")

end
