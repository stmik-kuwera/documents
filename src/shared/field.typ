#let dotted(w) = box(width: w, stroke: (bottom: (dash: "dotted", thickness: 0.6pt)), height: 1em)
#let filled(w, body) = box(width: w, stroke: (bottom: (dash: "dotted", thickness: 0.6pt)), inset: (bottom: 1pt), height: 1em, align(left + bottom, text(size: 7.5pt, body)))
#let field(value, w: 100%) = if value == none { dotted(w) } else { filled(w, value) }
