#import "../../shared/header.typ": stmik-header-base

#let penilaian-prestasi-magang(
  nama: none,
  nim: none,
  nama-tempat: none,
  tempat: none,
  jangka-waktu: none,
  jangka: none,
  deskripsi: none,
  tugas: none,
  keterangan: none,
  keterangan-lainnya: none,
  logo: "../../../assets/stmik_kuwera_logo.png",
) = {
  set page(paper: "a4", margin: (x: 1.5cm, top: 1cm, bottom: 1.2cm))
  set text(size: 8.5pt)
  set par(leading: 0.48em)

  stmik-header-base(image(logo, width: 2.1cm))
  align(center, text(size: 11pt, weight: 700)[PENILAIAN PRESTASI MAGANG])
  v(2pt)
  align(center, text(size: 8.5pt)[(Diisi oleh Pejabat di tempat magang)])
  v(14pt)

  let _nama-tempat = if nama-tempat != none { nama-tempat } else { tempat }
  let _jangka = if jangka-waktu != none { jangka-waktu } else { jangka }
  let _deskripsi = if deskripsi != none { deskripsi } else { tugas }
  let _keterangan = if keterangan-lainnya != none { keterangan-lainnya } else { keterangan }

  let label-cell(body, tall: false) = table.cell(
    align: left + (if tall { top } else { horizon }),
    inset: 5pt,
    text(size: 7.5pt, body),
  )
  let value-cell(body, tall: false, h: auto) = {
    let a = if tall { left + top } else { left + horizon }
    if h != auto {
      table.cell(align: a, inset: 5pt, block(height: h, width: 100%, align(a, text(size: 7.5pt, body))))
    } else {
      table.cell(align: a, inset: 5pt, text(size: 7.5pt, body))
    }
  }
  let colon(v) = if v == none { [:] } else { [: #v] }

  table(
    columns: (4.4cm, 1fr),
    stroke: 0.6pt,
    label-cell[Nama],
    value-cell(colon(nama)),
    label-cell[NIM],
    value-cell(colon(nim)),
    label-cell[Nama Tempat Magang],
    value-cell(colon(_nama-tempat)),
    label-cell[Jangka Waktu Magang],
    value-cell(colon(_jangka)),
    label-cell(tall: true)[Deskripsi Tugas Selama \ Magang],
    value-cell(colon(_deskripsi), tall: true, h: 9.2cm),
    label-cell[Keterangan Lainnya],
    value-cell(colon(_keterangan)),
    label-cell[],
    value-cell([], h: 0.9cm),
  )

  v(14pt)
  text(size: 6.5pt)[#super(text(size: 6pt, "*)")) Dimohon dengan hormat pula untuk mengisi Lampiran Rubrik Penilaian Kegiatan Magang di tempat Magang.]

  v(18pt)
  align(right, block(width: 6.8cm, align(left)[
    #text(size: 8pt)[Mengetahui,]
    #v(-2pt)
    #text(size: 8pt)[Pejabat di Tempat Magang,]
    #v(42pt)
    #align(center, box(width: 5cm, stroke: (bottom: (dash: "dotted", thickness: 0.6pt)), height: 1em))
    #v(2pt)
    #align(center, text(size: 7pt)[Nama / Jabatan / Cap Instansi])
  ]))
}

#let penilaian-prestasi = penilaian-prestasi-magang
