#import "../../shared/field.typ": dotted, filled, field
#import "../../shared/header.typ": stmik-header-base
#import "../../shared/table.typ": header-cell, body-cell

#let formulir-pendaftaran-magang(
  no: none,
  lokasi: none,
  alamat: none,
  hp: none,
  tanggal: none,
  anggota: (),
  ketua-nama: none,
  ketua-hp: none,
  tanggal-surat: none,
  nim-ketua: none,
  logo: "../../../assets/stmik_kuwera_logo.png",
  rows: 5,
) = {
  set page(paper: "a4", margin: (x: 1.5cm, top: 1cm, bottom: 1.2cm))
  set text(size: 8.5pt)
  set par(leading: 0.48em)

  stmik-header-base(image(logo, width: 2.1cm))

  align(center)[
    #text(size: 10pt, weight: 700)[#underline[FORMULIR PENDAFTARAN MAGANG]]
    #v(-4pt)
    #text(size: 9pt)[No. #box(width: 6cm, stroke: (bottom: (dash: "solid", thickness: 0.6pt)), height: 1em, if no == none { [] } else { align(left + bottom, text(size: 9pt, no)) })]
  ]
  v(10pt)

  text(size: 8.5pt)[Yth. Ketua Program Studi #box(width: 4.5cm, stroke: (bottom: (dash: "dotted", thickness: 0.6pt)), height: 1em)]
  v(-2pt)
  text(size: 8.5pt)[STMIK KUWERA]
  v(8pt)

  text(size: 8.5pt)[Kami mengajukan permohonan untuk melaksanakan Magang dengan keterangan sebagai berikut :]
  v(6pt)

  let _row(label, value) = grid(
    columns: (6.5cm, 0.4cm, 1fr),
    gutter: 2pt,
    align(left + horizon, text(size: 8.5pt, label)),
    align(center + horizon, text(size: 8.5pt)[:]),
    field(value),
  )

  let lokasi-val = if lokasi == none and alamat == none { none } else if alamat == none { lokasi } else if lokasi == none { alamat } else { lokasi + ", " + alamat }

  _row([a.\u{2003} Lokasi Magang & Alamat], lokasi-val)
  v(2pt)
  _row([b.\u{2003} No.HP (Penanggungjawab di Tempat Magang)], hp)
  v(2pt)
  _row([c.\u{2003} Tanggal Pelaksanaan], tanggal)
  v(10pt)

  let n = calc.max(rows, anggota.len())
  let cols = (0.7cm, 1fr, 2.2cm, 2.8cm, 1.6cm)
  table(
    columns: cols,
    stroke: 0.5pt,
    align: center + horizon,
    table.header(
      header-cell[NO],
      header-cell[NAMA],
      header-cell[NIM],
      header-cell[PROGRAM STUDI],
      header-cell[TOTAL\ SKS],
    ),
    ..for i in range(n) {
      if i < anggota.len() {
        let a = anggota.at(i)
        (
          body-cell[#(i + 1)],
          body-cell[#a.at("nama", default: none)],
          body-cell[#a.at("nim", default: none)],
          body-cell[#a.at("prodi", default: none)],
          body-cell[#a.at("sks", default: none)],
        )
      } else {
        (body-cell[#(i + 1)], body-cell[], body-cell[], body-cell[], body-cell[])
      }
    }
  )
  v(4pt)

  let k-nama = if ketua-nama != none { ketua-nama } else if anggota.len() > 0 { anggota.at(0).at("nama", default: none) } else { none }
  let k-hp = if ketua-hp != none { ketua-hp } else { none }

  text(size: 8pt)[Keterangan :\u{2003} No. 1\u{2003}:\u{2003} #field(k-nama, w: 4.2cm) \u{2003}(Ketua kelompok)]
  v(2pt)
  h(1.6cm)
  text(size: 8pt)[Nama\u{2003}:\u{2003} #field(k-nama, w: 4.2cm)]
  v(2pt)
  h(1.6cm)
  text(size: 8pt)[No HP\u{2003}:\u{2003} #field(k-hp, w: 4.2cm)]
  v(10pt)

  text(size: 8.5pt)[Demikian permohonan kami, atas perkenannya kami sampaikan terima kasih.]
  v(14pt)

  align(right, block(width: 6.2cm, align(left)[
    #text(size: 8.5pt)[Jakarta, #field(tanggal-surat, w: 3cm)]
    #v(-1pt)
    #text(size: 8.5pt)[Ketua Kelompok]
    #v(42pt)
    #align(center, box(width: 4.8cm, stroke: (bottom: (dash: "dotted", thickness: 0.6pt)), height: 1em, if k-nama == none { [] } else { align(center + bottom, text(size: 8pt, k-nama)) }))
    #v(4pt)
    #align(center, text(size: 8.5pt, weight: 700)[#underline(text("NIM. " + if nim-ketua == none { ".........................." } else { nim-ketua }))])
  ]))

  v(18pt)
  text(size: 6.5pt)[Formulir dibuat rangkap 4 untuk :#super(text(size: 5pt, "*)"))]
  v(-2pt)
  text(size: 6.5pt)[1.\u{2003} Mahasiswa]
  v(-2pt)
  text(size: 6.5pt)[2.\u{2003} Akademik]
  v(-2pt)
  text(size: 6.5pt)[3.\u{2003} Program Studi]
  v(-2pt)
  text(size: 6.5pt)[4.\u{2003} Arsip]
  v(2pt)
  text(size: 6pt)[#super(text(size: 5pt, "*)")) coret / hilangkan catatan saat diprint out yang tidak diperlukan.]
}
