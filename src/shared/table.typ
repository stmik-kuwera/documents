#let header-cell(content, colspan: 1) = table.cell(
  colspan: colspan,
  fill: rgb("#f3f4f6"),
  align: center + horizon,
  inset: 4pt,
  text(size: 7pt, weight: 700, content),
)
#let body-cell(content) = table.cell(
  align: center + horizon,
  inset: 4pt,
  text(size: 7pt, content),
)
