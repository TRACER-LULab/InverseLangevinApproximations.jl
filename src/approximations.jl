"""
From Ref. [cohen1991pade](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx y\\frac{3-y^2}{1-y^2}
```
"""
struct CohenRounded3_2 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::CohenRounded3_2)
    y * (3 - y^2) / (1 - y^2)
end
"""
From Ref. [cohen1991pade](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx y\\frac{3-\\frac{36}{35}y^2}{1-\\frac{33}{35}y^2}
```
"""
struct CohenExact3_2 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::CohenExact3_2)
    y * (3 - 36 / 35 * y^2) / (1 - 33 / 35 * y^2)
end

"""
From Ref. [cohen1991pade](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx  y  \\frac{(3 - \\frac{36}{35}  y^2)}{(1 - \\frac{33}{35}  y^2)}
```
"""
struct PadeApproximation3_2 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::PadeApproximation3_2)
    y * (3 - 36 / 35 * y^2) / (1 - 33 / 35 * y^2)
end
"""
From Ref. [puso2003mechanistic](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx \\frac{3y}{1-y^3}
```
"""
struct PusoApproximation <: AbstractInverseLangevinApproximation end
@inline function inverse_langevin_approximation(y, ::PusoApproximation)
    3 * y / (1 - y^3)
end

"""
From Ref. [treloar1976mechanics](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx \\frac{3  y}{(1 - (\\frac{3}{5} y^2 + \\frac{36}{175} y^4 + \\frac{108}{875} y^6))}
```
"""
struct TreloarApproximation <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::TreloarApproximation)
    3 * y / (1 - (3 / 5 * y^2 + 36 / 175 * y^4 + 108 / 875 * y^6))
end

"""
From Ref. [warner1972kinetic](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx \\frac{3y}{1-y^2}
```
"""
struct WarnerApproximation <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::WarnerApproximation)
    3 * y / (1 - y^2)
end

"""
From Ref. [kuhn1942beziehungen](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx 3y + \\frac{9}{5}y^3 + \\frac{297}{175}y^5 + \\frac{1539}{875}y^7 + \\frac{126117}{67375}y^9 + \\frac{43733439}{21896875}y^{11} + \\frac{231321177}{109484375}y^{13} + \\frac{20495009043}{9306171875}y^{15} + \\frac{1073585186448381}{476522530859375}y^{17} + \\frac{4387445039583}{1944989921875}y^{19}
```
"""
struct KuhnGrunApproximation <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::KuhnGrunApproximation)
    3y + 9y^3 / 5 + 297y^5 / 175 + 1539y^7 / 875 + 126117y^9 / 67375 + 43733439y^11 / 21896875 + 231321177y^13 / 109484375 + 20495009043y^15 / 9306171875 + 1073585186448381y^17 / 476522530859375 + 4387445039583y^19 / 1944989921875
end
"""
From Ref. [bergstrom1999large](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx\\begin{cases}
          1.31446\\tan{1.58986y}+0.91209y & |y|\\leq 0.84136 \\\\
          \\frac{1}{\\text{sign}(y)-y} & 0.84136 \\leq |x| < 1.0 \\\\

       \\end{cases}
```
"""
struct BergstromApproximation <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::BergstromApproximation)
    if abs(y) < 0.84136
        return 1.31446tan(1.58986y) + 0.91209y
    elseif 0.84136 <= abs(y) < 1.0
        return 1 / (sign(y) - y)
    end
end

"""
From Ref. [jedynak2015approximation](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx \\frac{3y}{1-\\frac{3}{5}y^2-\\frac{36}{175}y^4}
```
"""
struct PadeApproximation_1_4 <: AbstractInverseLangevinApproximation end
@inline function inverse_langevin_approximation(y, ::PadeApproximation_1_4)
    3y / (1 - 3y^2 / 5 - 36y^4 / 175)
end

"""
From Ref. [jedynak2015approximation](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx \\frac{3y}{1-\\frac{3}{5}y^2}
```
"""
struct PadeApproximation_1_2 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::PadeApproximation_1_2)
    3y / (1 - 3y^2 / 5)
end

"""
From Ref. [jedynak2015approximation](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx 3y + \\frac{9}{5}y^3 + \\frac{297}{175}y^5
```
"""
struct PadeApproximation_5_0 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::PadeApproximation_5_0)
    3y + 9y^3 / 5 + 297y^5 / 175
end

"""
From Ref. [jedynak2015approximation](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx 3y + \\frac{9}{5}y^3
```
"""
struct PadeApproximation_3_0 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::PadeApproximation_3_0)
    3y + 9y^3 / 5
end

"""
From Ref. [jedynak2017new](@cite):

```math
\\mathcal{L}^{-1}(y) \\approx y\\frac{3-\\frac{773}{768}y^2-\\frac{1300}{1351}y^4+\\frac{501}{340}y^6-\\frac{678}{138}y^8}{(1-y)(1+\\frac{866}{853}*y)}
```
"""
struct Jedynak2017 <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::Jedynak2017)
    y * (3 - 773 / 768 * y^2 - 1300 / 1351 * y^4 + 501 / 340 * y^6 - 678 / 1385 * y^8) / (1 - y) / (1 + 866 / 853 * y)
end

"""
From Ref. [darabi2015simple](@cite):

```math
{\\mathcal{L}^{- 1}}(y) \\approx y\\frac{{y^{2} - 3y + 3}}{{1 - y}}.
```
"""
struct DarabiItskov <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::DarabiItskov)
    y * (y^2 - 3y + 3) / (1 - y)
end

"""
From Ref. [nguessong2014new](@cite):

```math
{\\mathcal{L}^{-1}}\\left( y \\right)\\approx y\\frac{3-y^{2}}{1-y^{2}}-0.488y^{3.243}+3.311y^{4.789}\\left( y-0.76 \\right)\\left( y-1 \\right)
```
"""
struct NguessongBedaPeyraut <: AbstractInverseLangevinApproximation end

@inline function inverse_langevin_approximation(y, ::NguessongBedaPeyraut)
    y * (3 - y^2) / (1 - y^2) - 0.488y^3.243 + 3.311y^4.789 * (y - 0.76) * (y - 1)
end
