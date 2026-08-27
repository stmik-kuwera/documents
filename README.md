# STMIK Kuwera — Documents (Typst)

Modular Typst templates.

- `daftar-hadir-magang` — DAFTAR HADIR & KEGIATAN MAHASISWA DI TEMPAT MAGANG
- `formulir-pendaftaran-magang` — FORMULIR PENDAFTARAN MAGANG
- `formulir-pengajuan-dosen` — FORMULIR PENGAJUAN DOSEN PEMBIMBING MAGANG
- `kartu-bimbingan-magang` — KARTU BIMBINGAN MAGANG
- `penilaian-prestasi-magang` — PENILAIAN PRESTASI MAGANG

## Structure

```
assets/stmik_kuwera_logo.png
src/
  shared/field.typ        # dotted/filled/field helpers
  shared/header.typ       # stmik-header-base, stmik-header
  shared/table.typ        # header-cell/body-cell
  templates/daftar-hadir-magang/
    lib.typ               # daftar-hadir-magang(...)
    template.typ          # blank
    template.pdf          # committed preview
    example.typ           # filled demo
    example.pdf           # committed preview
  templates/formulir-pendaftaran-magang/
    lib.typ               # formulir-pendaftaran-magang(...)
    template.typ
    template.pdf
    example.typ
    example.pdf
  templates/penilaian-prestasi-magang/
    lib.typ               # penilaian-prestasi-magang(...)
    template.typ
    template.pdf
    example.typ
    example.pdf
lib.typ                   # facade re-exporting all templates
```

## Requirements

- `typst >= 0.11`

## Quick Start

```bash
typst compile src/templates/daftar-hadir-magang/template.typ --root . src/templates/daftar-hadir-magang/template.pdf
typst compile src/templates/daftar-hadir-magang/example.typ --root . src/templates/daftar-hadir-magang/example.pdf
typst compile src/templates/formulir-pendaftaran-magang/template.typ --root . src/templates/formulir-pendaftaran-magang/template.pdf
typst compile src/templates/formulir-pendaftaran-magang/example.typ --root . src/templates/formulir-pendaftaran-magang/example.pdf
typst compile src/templates/penilaian-prestasi-magang/template.typ --root . src/templates/penilaian-prestasi-magang/template.pdf
typst compile src/templates/penilaian-prestasi-magang/example.typ --root . src/templates/penilaian-prestasi-magang/example.pdf
```

## Daftar Hadir Magang

```typ
#import "lib.typ": daftar-hadir-magang

#daftar-hadir-magang()
#daftar-hadir-magang(
  nama: "Budi Santoso",
  nim: "20240001",
  pejabat: ((nama: "Siti Aminah", jabatan: "HR Manager", hp: "0812-3456-7890"),),
  entries: ((hari_tanggal: "Senin, 03 Feb 2026", datang: "08:00", pulang: "16:00", kegiatan: "Orientasi"),),
  rows: 19,
)
```

## Formulir Pendaftaran Magang

```typ
#import "lib.typ": formulir-pendaftaran-magang

#formulir-pendaftaran-magang()
#formulir-pendaftaran-magang(
  no: "001/MAGANG/2026",
  lokasi: "PT Maju Jaya, Jl. Sudirman No. 10",
  hp: "0812-3456-7890",
  tanggal: "10 Feb - 10 Mei 2026",
  anggota: (
    (nama: "Budi Santoso", nim: "20240001", prodi: "Sistem Informasi", sks: "6"),
  ),
  tanggal-surat: "03 Feb 2026",
  nim-ketua: "20240001",
)
```

| Param | Type | Default | Notes |
|-------|------|---------|-------|
| `no` | `str`/`none` | `none` | Blank → line |
| `lokasi`/`alamat` | `str`/`none` | `none` | Combined |
| `hp` | `str`/`none` | `none` | No.HP PJ |
| `tanggal` | `str`/`none` | `none` | Tanggal Pelaksanaan |
| `anggota` | `array(dict(nama,nim,prodi,sks))` | `()` | Rows auto-pad to 5 |
| `ketua-nama`/`ketua-hp` | `str`/`none` | from anggota[0] | Keterangan |
| `tanggal-surat`/`nim-ketua` | `str`/`none` | `none` | Signature |
| `rows` | `int` | `5` | Min table rows |

## Penilaian Prestasi Magang

```typ
#import "lib.typ": penilaian-prestasi-magang

#penilaian-prestasi-magang()
#penilaian-prestasi-magang(
  nama: "Budi Santoso",
  nim: "20240001",
  nama-tempat: "PT Maju Jaya, Jakarta",
  jangka-waktu: "03 Feb — 30 Apr 2026",
  deskripsi: "Membantu pengembangan sistem informasi inventaris...",
  keterangan-lainnya: "Disiplin dan komunikatif.",
)
```

| Param | Type | Default | Notes |
|-------|------|---------|-------|
| `nama` | `str`/`none` | `none` | Nama mahasiswa |
| `nim` | `str`/`none` | `none` | NIM |
| `nama-tempat`/`tempat` | `str`/`none` | `none` | Nama Tempat Magang |
| `jangka-waktu`/`jangka` | `str`/`none` | `none` | Jangka Waktu Magang |
| `deskripsi`/`tugas` | `str`/`none` | `none` | Deskripsi Tugas Selama Magang |
| `keterangan-lainnya`/`keterangan` | `str`/`none` | `none` | Keterangan Lainnya |

## Adding a New Template

```bash
mkdir -p src/templates/nama-template
# implement lib.typ, template.typ, example.typ
# add to lib.typ: import "src/templates/nama-template/lib.typ": nama-template
```

All templates reuse `src/shared/*`.

## Git Submodule

```bash
git submodule add https://github.com/<you>/documents.git documents
#import "documents/lib.typ": daftar-hadir-magang, formulir-pendaftaran-magang
typst compile documents/src/templates/formulir-pendaftaran-magang/example.typ --root documents
```

PDFs under `src/templates/*/example.pdf` are committed and visible on GitHub.
