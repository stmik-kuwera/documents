#let stmik-header(logo-img) = {
  box(width: 100%, height: 2.4cm)[
    #place(left + horizon, dx: 0pt, dy: 0pt, logo-img)
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
          #text(size: 7pt, fill: rgb("#2563eb"))[Website: #underline(text("https://stmikku.ac.id")) \u{2003} E-mail: #underline(text("info@stmikku.ac.id"))]
        ]
      ]
    ]
  ]
  v(4pt)
  line(length: 100%, stroke: 0.7pt)
  v(6pt)
  block(width: 100%, align(center, text(size: 13pt, weight: 800)[DAFTAR HADIR & KEGIATAN MAHASISWA DI TEMPAT MAGANG]))
  v(12pt)
}
