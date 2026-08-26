#import "../../shared/field.typ": dotted, filled, field
#import "../../shared/header.typ": stmik-header
#import "../../shared/table.typ": header-cell, body-cell

#let daftar-hadir-magang(
  nama: none,
  nim: none,
  pejabat: (),
  rows: 19,
  entries: none,
  logo: "../../../assets/stmik_kuwera_logo.png",
) = {
  set page(paper: "a4", margin: (x: 1.5cm, top: 1cm, bottom: 1.4cm))
  set text(size: 8.5pt)
  set par(leading: 0.45em)

  let p0 = if pejabat.len() > 0 { pejabat.at(0) } else { (nama: none, jabatan: none, hp: none) }
  let p1 = if pejabat.len() > 1 { pejabat.at(1) } else { (nama: none, jabatan: none, hp: none) }
  let p2 = if pejabat.len() > 2 { pejabat.at(2) } else { (nama: none, jabatan: none, hp: none) }

  stmik-header(image(logo, width: 2.1cm))

  grid(
    columns: (6.2cm, 0.95cm, 1fr, 1.2cm, 1fr, 3.2cm),
    gutter: 2pt,
    row-gutter: 3.5pt,
    align(left + horizon, text(size: 7.5pt)[Nama]),
    align(right + horizon, text(size: 7.5pt)[:]),
    field(nama),
    align(right + horizon, text(size: 7.5pt)[NIM]),
    field(nim),
    [],
    align(left + horizon, text(size: 7.5pt)[Nama Pejabat dari Instansi/Perusahaan#super(text(size: 5pt, "*)"))]),
    align(right + horizon, text(size: 7.5pt)[: 1.]),
    field(p0.at("nama", default: none)),
    align(right + horizon, text(size: 7.5pt)[Jabatan]),
    field(p0.at("jabatan", default: none)),
    align(left + horizon, grid(columns: (1.2cm, 1fr), gutter: 2pt, text(size: 7.5pt)[No Hp.], field(p0.at("hp", default: none)))),
    align(left + horizon, []),
    align(right + horizon, text(size: 7.5pt)[2.]),
    field(p1.at("nama", default: none)),
    align(right + horizon, text(size: 7.5pt)[Jabatan]),
    field(p1.at("jabatan", default: none)),
    align(left + horizon, grid(columns: (1.2cm, 1fr), gutter: 2pt, text(size: 7.5pt)[No Hp.], field(p1.at("hp", default: none)))),
    align(left + horizon, []),
    align(right + horizon, text(size: 7.5pt)[3.]),
    field(p2.at("nama", default: none)),
    align(right + horizon, text(size: 7.5pt)[Jabatan]),
    field(p2.at("jabatan", default: none)),
    align(left + horizon, grid(columns: (1.2cm, 1fr), gutter: 2pt, text(size: 7.5pt)[No Hp.], field(p2.at("hp", default: none)))),
  )

  v(10pt)

  let data = if entries == none { none } else { entries }
  let n = if data == none { rows } else { calc.max(rows, data.len()) }

  table(
    columns: (0.65cm, 2.35cm, 1.15cm, 1.15cm, 1fr, 1.95cm),
    stroke: 0.5pt,
    align: center + horizon,
    table.header(
      table.cell(rowspan: 2, fill: rgb("#f3f4f6"), align: center + horizon, inset: 4pt, text(size: 7pt, weight: 700)[No]),
      table.cell(rowspan: 2, fill: rgb("#f3f4f6"), align: center + horizon, inset: 4pt, text(size: 7pt, weight: 700)[Hari & Tanggal]),
      header-cell(colspan: 2)[Pukul],
      table.cell(rowspan: 2, fill: rgb("#f3f4f6"), align: center + horizon, inset: 4pt, text(size: 7pt, weight: 700)[Jenis Kegiatan yang Dilakukan]),
      table.cell(rowspan: 2, fill: rgb("#f3f4f6"), align: center + horizon, inset: 4pt, text(size: 7pt, weight: 700)[Paraf Pejabat]),
      header-cell[Datang],
      header-cell[Pulang],
    ),
    ..for i in range(n) {
      if data != none and i < data.len() {
        let e = data.at(i)
        (
          body-cell[#(i + 1)],
          body-cell[#e.at("hari_tanggal", default: none)],
          body-cell[#e.at("datang", default: none)],
          body-cell[#e.at("pulang", default: none)],
          body-cell[#e.at("kegiatan", default: none)],
          body-cell[#e.at("paraf", default: none)],
        )
      } else {
        (
          body-cell[#(i + 1)],
          body-cell[],
          body-cell[],
          body-cell[],
          body-cell[],
          body-cell[],
        )
      }
    }
  )

  v(18pt)
  align(right, block(width: 6.5cm, align(left)[
    #text(size: 7.5pt)[Mengetahui,]
    #v(-2pt)
    #text(size: 7.5pt)[Pembimbing Magang Instansi/Perusahaan#super(text(size: 5pt, "*)"))]
    #v(52pt)
    #align(center, box(width: 5.5cm, stroke: (bottom: (dash: "dotted", thickness: 0.6pt)), height: 1em))
  ]))

  v(28pt)
  text(size: 6pt)[#super(text(size: 5pt, "*)")) pilih salah satu / hilangkan catatan saat diprint out yang tidak diperlukan.]
}

#let daftar-hadir = daftar-hadir-magang
