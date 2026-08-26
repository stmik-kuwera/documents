#set page(paper: "a4", margin: (x: 1.5cm, top: 1cm, bottom: 1.4cm))
#set text(size: 8.5pt)
#set par(leading: 0.45em)

#let dotted(w) = box(width: w, stroke: (bottom: (dash: "dotted", thickness: 0.6pt)), height: 1em)

#box(width: 100%, height: 2.4cm)[
  #place(left + horizon, dx: 0pt, dy: 0pt, image("assets/stmik_kuwera_logo.png", width: 2.1cm))
  #block(width: 100%, height: 100%)[
    #align(center + horizon)[
      #block(width: 100%)[
        #text(size: 9.5pt, weight: 400)[KEMENTERIAN PENDIDIKAN DAN KEBUDAYAAN]
        #v(-3pt)
        #text(size: 9.5pt, weight: 400)[STMIK KUWERA]
        #v(-3pt)
        #text(size: 11.5pt, weight: 800)[PROGRAM STUDI SISTEM INFORMASI]
        #v(-3pt)
        #text(size: 7pt)[Jl.Kalideres Permai No.3C, RT.1/RW.14, Kalideres, Kec. Kalideres,]
        #v(-3pt)
        #text(size: 7pt)[Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11830]
        #v(-2pt)
        #text(size: 7pt, fill: rgb("#2563eb"))[Website: #underline(text("http://stmikku.ac.id")) \u{2003} E-mail: #underline(text("info@stmikku.ac.id"))]
      ]
    ]
  ]
]

#v(4pt)
#line(length: 100%, stroke: 0.7pt)
#v(6pt)
#block(width: 100%, align(center)[#text(size: 13pt, weight: 800)[DAFTAR HADIR & KEGIATAN MAHASISWA DI TEMPAT MAGANG]])
#v(12pt)

#grid(
  columns: (6.2cm, 0.95cm, 1fr, 1.2cm, 1fr, 3.2cm),
  gutter: 2pt,
  row-gutter: 3.5pt,
  align(left)[#text(size: 7.5pt)[Nama]],
  align(right)[#text(size: 7.5pt)[:]],
  dotted(100%),
  align(right)[#text(size: 7.5pt)[NIM]],
  dotted(100%),
  [],
  align(left)[#text(size: 7.5pt)[Nama Pejabat dari Instansi/Perusahaan#super(text(size: 5pt, "*)"))]],
  align(right)[#text(size: 7.5pt)[: 1.]],
  dotted(100%),
  align(right)[#text(size: 7.5pt)[Jabatan]],
  dotted(100%),
  align(left)[#grid(columns: (1.2cm, 1fr), gutter: 2pt, text(size: 7.5pt)[No Hp.], dotted(100%))],
  align(left)[],
  align(right)[#text(size: 7.5pt)[2.]],
  dotted(100%),
  align(right)[#text(size: 7.5pt)[Jabatan]],
  dotted(100%),
  align(left)[#grid(columns: (1.2cm, 1fr), gutter: 2pt, text(size: 7.5pt)[No Hp.], dotted(100%))],
  align(left)[],
  align(right)[#text(size: 7.5pt)[3.]],
  dotted(100%),
  align(right)[#text(size: 7.5pt)[Jabatan]],
  dotted(100%),
  align(left)[#grid(columns: (1.2cm, 1fr), gutter: 2pt, text(size: 7.5pt)[No Hp.], dotted(100%))],
)

#v(10pt)

#let rows = 19

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

#table(
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
  ..for i in range(rows) {
    (
      body-cell[#(i + 1)],
      body-cell[],
      body-cell[],
      body-cell[],
      body-cell[],
      body-cell[],
    )
  }
)

#v(18pt)
#align(right)[
  #block(width: 6.5cm, align(left)[
    #text(size: 7.5pt)[Mengetahui,]
    #v(-2pt)
    #text(size: 7.5pt)[Pembimbing Magang Instansi/Perusahaan#super(text(size: 5pt, "*)"))]
    #v(52pt)
    #align(center)[
      #box(width: 5.5cm, stroke: (bottom: (dash: "dotted", thickness: 0.6pt)), height: 1em)
    ]
  ])
]

#v(28pt)
#text(size: 6pt)[#super(text(size: 5pt, "*)")) pilih salah satu / hilangkan catatan saat diprint out yang tidak diperlukan.]
