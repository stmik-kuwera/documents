#import "../../shared/field.typ": dotted, field
#import "../../shared/header.typ": stmik-header-base
#import "../../shared/table.typ": header-cell, body-cell

#let kartu-bimbingan-magang(
  nama: (),
  bimbingan: (),
  rows: 12,
  logo: "../../../assets/stmik_kuwera_logo.png",
) = {
  set page(paper: "a4", margin: (x: 1.5cm, top: 1cm, bottom: 1.2cm))
  set text(size: 8.5pt)
  set par(leading: 0.48em)

  stmik-header-base(image(logo, width: 2.1cm))
  align(center, text(size: 10pt, weight: 700, underline[KARTU BIMBINGAN MAGANG]))
  v(10pt)

  let nama-rows = 5
  for i in range(nama-rows) {
    let e = if i < nama.len() { nama.at(i) } else { (nama: none, nim: none) }
    let n = e.at("nama", default: none)
    let m = e.at("nim", default: none)
    grid(
      columns: (0.9cm, 6.2cm, 1fr),
      gutter: 3pt,
      if i == 0 { align(left + horizon, text(size: 8pt)[Nama]) } else { [] },
      align(left + horizon, grid(
        columns: (0.7cm, 1fr, 0.3cm, 2.4cm, 0.3cm),
        gutter: 2pt,
        align(right + horizon, text(size: 8pt)[#(": " + str(i + 1) + ".")]),
        if n == none { dotted(100%) } else { box(width: 100%, stroke: (bottom: (dash: "solid", thickness: 0.6pt)), inset: (bottom: 1pt), height: 1em, align(left + bottom, text(size: 8pt, n))) },
        align(center + horizon, text(size: 8pt)[(]),
        if m == none { dotted(100%) } else { box(width: 100%, stroke: (bottom: (dash: "solid", thickness: 0.6pt)), inset: (bottom: 1pt), height: 1em, align(center + bottom, text(size: 8pt, m))) },
        align(center + horizon, text(size: 8pt)[)]),
      )),
      [],
    )
    v(2pt)
  }

  v(8pt)

  let n = calc.max(rows, bimbingan.len())
  table(
    columns: (1.15cm, 1fr, 5cm, 1.4cm),
    stroke: 0.6pt,
    align: center + horizon,
    table.header(
      header-cell[Tgl/Bln],
      header-cell[Topik\ Pertemuan/Diskusi/Konsultasi],
      header-cell[Arahan Pembimbing],
      header-cell[Paraf],
    ),
    ..for i in range(n) {
      if i < bimbingan.len() {
        let b = bimbingan.at(i)
        (
          body-cell[#b.at("tgl", default: none)],
          table.cell(align: left + top, inset: 5pt, text(size: 7.5pt, b.at("topik", default: none))),
          table.cell(align: left + top, inset: 5pt, text(size: 7.5pt, b.at("arahan", default: none))),
          body-cell[#b.at("paraf", default: none)],
        )
      } else {
        (body-cell[], table.cell(align: left + top, inset: 5pt, []), table.cell(align: left + top, inset: 5pt, []), body-cell[])
      }
    }
  )

  v(10pt)
  align(right, block(width: 6.5cm, align(left)[
    #text(size: 8pt)[Mengetahui Dosen Pembimbing,]
    #v(36pt)
    #align(center, box(width: 4.5cm, stroke: (bottom: (dash: "dotted", thickness: 0.6pt)), height: 1em))
    #v(2pt)
    #align(left, text(size: 8pt, weight: 700)[#underline(text("NIK. ")) #box(width: 3.8cm, stroke: (bottom: (dash: "solid", thickness: 0.7pt)), height: 1em)])
  ]))
}
