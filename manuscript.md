---
documentclass: report
classoption: oneside
date: false
polyglossia-lang:
  name: french
geometry:
  - left = 2cm
  - right = 2cm
  - top = 2cm
  - bottom = 2cm
fontsize: 12pt
toc: true
linestretch: false
bibliography: [./rreferences.bib] # This field is overid when pandoc is use, but it allow to use citation completion when writting.
---

# The model

This is a citation: @Martinez2002 -- we can also have citations in brackets
[@Martinez2002].

## Lists

1. one fish
2. two fish
3. red fish
4. blue fish

# Methods

There is an equation, which we can cite with {@eq:eq1}.

$$J'(p) = \frac{1}{\text{log}(S)}\times\left(-\sum p \text{log}(p)\right)$$ {#eq:eq1}

# Tables

We can do tables:

| Column 1 | Column 2 |      Column 3    |
| -------- | :-------:| ---------------: |
| c1       |    c2    |       $\alpha$   |

Table: Demonstration of a simple table. {#tbl:1}

The first column is neat, the second centered and the third right-aligned. We can also cite table with {@tbl:1}

# Figures

![This is the legend of the figure](figures/biomes.png){#fig:biomes}

We can refer to @fig:biomes.

# Code?

Yes

~~~ julia
for i in eachindex(x)
  x[i] = zero(eltype(x)) # Don't do that
end
~~~

# References
