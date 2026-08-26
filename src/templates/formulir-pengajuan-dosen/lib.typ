#import "../../shared/header.typ": stmik-header-base
#import "../../shared/table.typ": header-cell, body-cell

#let formulir-pengajuan-dosen(
  anggota: (),
  rows: 1,
  logo: "../../../assets/stmik_kuwera_logo.png",
) = {
  set page(paper: "a4", margin: (x: 1.2cm, top: 1cm, bottom: 1.2cm))
  set text(size: 8.5pt)
  set par(leading: 0.48em)

  stmik-header-base(image(logo, width: 2.1cm))
  align(center, text(size: 10pt, weight: 700, underline[FORMULIR PENGAJUAN DOSEN PEMBIMBING MAGANG]))
  v(10pt)

  let n = calc.max(rows, anggota.len())

  let nama-kelompok-cell(entry) = {
    if entry == none {
      [
        #align(left, text(size: 7pt)[Ketua :])
        #v(6pt)
        #align(left, text(size: 7pt)[Anggota :])
        #text(size: 7pt)[\u{2003} 1 \ #linebreak() \u{2003} 2 \ #linebreak() \u{2003} 3 \ #linebreak() \u{2003} 4]
      ]
    } else {
      let k = entry.at("ketua", default: none)
      let ag = entry.at("anggota", default: ())
      let ag-text = if ag.len() == 0 {
        [\u{2003} 1 \ #linebreak() \u{2003} 2 \ #linebreak() \u{2003} 3 \ #linebreak() \u{2003} 4]
      } else {
        ag.enumerate().map(p => {
          let i = p.at(0)
          let n = p.at(1)
          [\u{2003} #(i + 1). #n]
        }).join(linebreak())
      }
      [
        #align(left, text(size: 7pt)[Ketua : #if k != none { k }])
        #v(4pt)
        #align(left, text(size: 7pt)[Anggota :])
        #text(size: 7pt, ag-text)
      ]
    }
  }

  let nim-cell(entry) = {
    if entry == none { [] } else {
      let kn = entry.at("ketua-nim", default: none)
      let an = entry.at("anggota-nim", default: ())
      let t = if kn != none { kn } else { "" }
      if an.len() > 0 {
        t += "\n\n" + an.join("\n")
      }
      text(size: 7pt, t)
    }
  }

  let telp-cell(entry) = {
    if entry == none { [] } else {
      let kt = entry.at("ketua-telp", default: entry.at("ketua-hp", default: entry.at("hp", default: none)))
      let at = entry.at("anggota-telp", default: entry.at("anggota-hp", default: ()))
      let t = if kt != none { kt } else { "" }
      if at.len() > 0 {
        t += "\n\n" + at.join("\n")
      }
      text(size: 7pt, t)
    }
  }

  table(
    columns: (0.6cm, 2.6cm, 2cm, 2cm, 1fr, 1.7cm, 1.35cm, 1.4cm),
    stroke: 0.7pt,
    align: center + horizon,
    table.header(
      header-cell[NO],
      header-cell[NAMA KELOMPOK],
      header-cell[NIM],
      header-cell[NO.\ TELP/HP],
      header-cell[JUDUL],
      header-cell[TGL PENGAJUAN],
      header-cell[TGL LULUS],
      header-cell[NILAI AKHIR],
    ),
    ..for i in range(n) {
      let e = if i < anggota.len() { anggota.at(i) } else { none }
      (
        body-cell[#(i + 1)],
        table.cell(align: left + top, inset: 4pt, nama-kelompok-cell(e)),
        table.cell(align: left + top, inset: 4pt, nim-cell(e)),
        table.cell(align: left + top, inset: 4pt, telp-cell(e)),
        body-cell[#if e != none { e.at("judul", default: []) } else { [] }],
        body-cell[#if e != none { e.at("tgl-pengajuan", default: []) } else { [] }],
        body-cell[#if e != none { e.at("tgl-lulus", default: []) } else { [] }],
        body-cell[#if e != none { e.at("nilai", default: []) } else { [] }],
      )
    }
  )

  v(12pt)
  align(right, block(width: 6.5cm, align(left)[
    #text(size: 8pt)[Jakarta, #box(width: 3.5cm, stroke: (bottom: (dash: "dotted", thickness: 0.6pt)), height: 1em)]
    #v(-2pt)
    #text(size: 8pt)[Yang mengajukan,]
    #v(44pt)
    #align(center, box(width: 4.5cm, stroke: (bottom: (dash: "dotted", thickness: 0.6pt)), height: 1em))
  ]))
}
