"""
From:

> Cohen A. A Padé approximant to the inverse Langevin function. Rheologica acta. 1991 May;30:270-3.

```math
\\mathcal{L}^{-1}(y) = y\\frac{3-y^2}{1-y^2}
```
"""
struct CohenRounded3_2 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::CohenRounded3_2, y)
    y * (3 - y^2) / (1 - y^2)
end
"""
From:

> Cohen A. A Padé approximant to the inverse Langevin function. Rheologica acta. 1991 May;30:270-3.

```math
\\mathcal{L}^{-1}(y) = y\\frac{3-\\frac{36}{35}y^2}{1-\\frac{33}{35}y^2}
```
"""
struct CohenExact3_2 <:AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::CohenExact3_2, y)
    y * (3 - 36 / 35 * y^2) / (1 - 33 / 35 * y^2)
end

"""
From:

> Cohen A. A Padé approximant to the inverse Langevin function. Rheologica acta. 1991 May;30:270-3.

```math
\\mathcal{L}^{-1}(y) =  y * \\frac{(3 - \\frac{36}{35} * y^2)}{(1 - \\frac{33}{35} * y^2)}
```
"""
struct PadeApproximation3_2 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::PadeApproximation3_2, y)
    y * (3 - 36 / 35 * y^2) / (1 - 33 / 35 * y^2)
end
"""
From:

> Puso M. Mechanistic constitutive models for rubber elasticity and viscoelasticity. Lawrence Livermore National Lab.(LLNL), Livermore, CA (United States); 2003 Jan 21.

```math
\\mathcal{L}^{-1}(y) = \\frac{3y}{1-y^3}
```
"""
struct PusoApproximation <: AbstractInverseLangevinApproximation end
@inline function inverse_langevin_approximation(::PusoApproximation, y)
    3 * y / (1 - y^3)
end

"""
From:

> Treloar LG. The physics of rubber elasticity.

```math
\\mathcal{L}^{-1}(y) = \\frac{3 * y}{(1 - (\\frac{3}{5} * y^2 + \\frac{36}{175} * y^4 + \\frac{108}{875} * y^6))}
```
"""
struct TreloarApproximation <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::TreloarApproximation, y)
    3 * y / (1 - (3 / 5 * y^2 + 36 / 175 * y^4 + 108 / 875 * y^6))
end

"""
From:

> Warner Jr HR. Kinetic theory and rheology of dilute suspensions of finitely extendible dumbbells. Industrial & Engineering Chemistry Fundamentals. 1972 Aug;11(3):379-87.

```math
\\mathcal{L}^{-1}(y) = \\frac{3y}{1-y^2}
```
"""
struct WarnerApproximation <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::WarnerApproximation, y)
    3 * y / (1 - y^2)
end

"""
From:

> Kuhn W, Grün F. Beziehungen zwischen elastischen Konstanten und Dehnungsdoppelbrechung hochelastischer Stoffe. Kolloid-Zeitschrift. 1942 Dec;101:248-71.:

```math
\\mathcal{L}^{-1}(y) = 3y + \\frac{9y^3}{5} + \\frac{297y^5}{175} + \\frac{1539y^7}{875} + \\frac{126117y^9}{67375} + \\frac{43733439y^11}{21896875} + \\frac{231321177y^13}{109484375} + \\frac{20495009043y^15}{9306171875} + \\frac{1073585186448381y^17}{476522530859375} + \\frac{4387445039583y^19}{1944989921875}
```
"""
struct KuhnGrunApproximation <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::KuhnGrunApproximation, y)
    3y + 9y^3 / 5 + 297y^5 / 175 + 1539y^7 / 875 + 126117y^9 / 67375 + 43733439y^11 / 21896875 + 231321177y^13 / 109484375 + 20495009043y^15 / 9306171875 + 1073585186448381y^17 / 476522530859375 + 4387445039583y^19 / 1944989921875
end
"""
From:

> Bergström JS. Large strain time-dependent behavior of elastomeric materials (Doctoral dissertation, Massachusetts Institute of Technology).

```math
\\mathcal{L}^{-1}(y) =\\begin{cases}
          1.31446\\tan{1.58986y}+0.91209y & |y|\\leq 0.84136 \\\\
          \\frac{1}{\\text{sign}(y)-y} & 0.84136 \\leq |x| < 1.0 \\\\

       \\end{cases}
```
"""
struct BergstromApproximation <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::BergstromApproximation, y)
    if abs(y) < 0.84136
        return 1.31446tan(1.58986y) + 0.91209y
    elseif 0.84136 <= abs(y) < 1.0
        return 1 / (sign(y) - y)
    end
end

"""
From:

> Jedynak R. Approximation of the inverse Langevin function revisited. Rheologica Acta. 2015 Jan;54(1):29-39.

```math
\\mathcal{L}^{-1}(y) = \\frac{3y}{1-\\frac{3}{5}y^2-\\frac{36}{175}y^4}
```
"""
struct PadeApproximation_1_4 <: AbstractInverseLangevinApproximation end
@inline function inverse_langevin_approximation(::PadeApproximation_1_4, y)
    3y / (1 - 3y^2 / 5 - 36y^4 / 175)
end

"""
From:

> Jedynak R. Approximation of the inverse Langevin function revisited. Rheologica Acta. 2015 Jan;54(1):29-39.

```math
\\mathcal{L}^{-1}(y) = \\frac{3y}{1-\\frac{3}{5}y^2}
```
"""
struct PadeApproximation_1_2 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::PadeApproximation_1_2, y)
    3y / (1 - 3y^2 / 5)
end

"""
From:

> Jedynak R. Approximation of the inverse Langevin function revisited. Rheologica Acta. 2015 Jan;54(1):29-39.

```math
\\mathcal{L}^{-1}(y) = 3y + \\frac{9}{5}y^3 + \\frac{297}{175}y^5
```
"""
struct PadeApproximation_5_0 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::PadeApproximation_5_0, y)
    3y + 9y^3 / 5 + 297y^5 / 175
end

"""
From:

> Jedynak R. Approximation of the inverse Langevin function revisited. Rheologica Acta. 2015 Jan;54(1):29-39.

```math
\\mathcal{L}^{-1}(y) = 3y + \\frac{9}{5}y^3
```
"""
struct PadeApproximation_3_0 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::PadeApproximation_3_0, y)
    3y + 9y^3 / 5
end

"""
From:

> Jedynak R. New facts concerning the approximation of the inverse Langevin function. Journal of Non-Newtonian Fluid Mechanics. 2017 Nov 1;249:8-25.

```math
\\mathcal{L}^{-1}(y) = y\\frac{3-\\frac{773}{768}y^2-\\frac{1300}{1351}y^4+\\frac{501}{340}y^6-\\frac{678}{138}y^8}{(1-y)(1+\\frac{866}{853}*y)}
```
"""
struct Jedynak2017 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::Jedynak2017, y)
    y * (3 - 773 / 768 * y^2 - 1300 / 1351 * y^4 + 501 / 340 * y^6 - 678 / 1385 * y^8) / (1 - y) / (1 + 866 / 853 * y)
end

"""
From:

> Darabi E, Itskov M. A simple and accurate approximation of the inverse Langevin function. Rheologica Acta. 2015 May;54:455-9.

```math
{\\mathcal{L}^{- 1}}(y) \\approx y\\frac{{y^{2} - 3y + 3}}{{1 - y}}.
```
"""
struct DarabiItskov <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(::DarabiItskov, y)
    y * (y^2 - 3y + 3) / (1 - y)
end

"""
From:

> Nguessong AN, Beda T, Peyraut F. A new based error approach to approximate the inverse Langevin function. Rheologica Acta. 2014 Aug;53:585-91.

```math
{\\mathcl{L}^{-1}}\\left( y \\right)\\simeq y\\frac{3-y^{2}}{1-y^{2}}-0.488y^{3.243}+3.311y^{4.789}\\left( y-0.76 \\right)\\left( y-1 \\right)
```
"""
struct NguessongBedaPeyraut <: AbstractInverseLangevinApproximation end
@inline function inverse_langevin_approximation(::NguessongBedaPeyraut, y)
    y * (3 - y^2) / (1 - y^2) - 0.488y^3.243 + 3.311y^4.789 * (y - 0.76) * (y - 1)
end
