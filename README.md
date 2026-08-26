# STMIK Kuwera — Daftar Hadir Magang (Typst)

Typst template for **DAFTAR HADIR & KEGIATAN MAHASISWA DI TEMPAT MAGANG** — matches the original STMIK Kuwera form with full-width header, dotted fields, and 19-row table.

## Files

- `lib.typ` — reusable function `daftar-hadir(...)`
- `daftar-hadir-magang.typ` — blank wrapper (19 rows, ready to print)
- `example-filled.typ` — filled example
- `assets/stmik_kuwera_logo.png` — logo

## Requirements

- `typst >= 0.11`

## Quick Start (blank)

```bash
typst compile daftar-hadir-magang.typ
typst watch daftar-hadir-magang.typ
```

## Reusable Template

```typ
#import "lib.typ": daftar-hadir

// blank
#daftar-hadir()

// filled
#daftar-hadir(
  nama: "Budi Santoso",
  nim: "20240001",
  pejabat: (
    (nama: "Siti Aminah", jabatan: "HR Manager", hp: "0812-3456-7890"),
    (nama: "Joko Widodo", jabatan: "Supervisor", hp: "0813-9876-5432"),
  ),
  entries: (
    (hari_tanggal: "Senin, 03 Feb 2026", datang: "08:00", pulang: "16:00", kegiatan: "Orientasi", paraf: ""),
  ),
  rows: 19, // minimum rows, padded with blanks if entries < rows
)
```

### Parameters

| Param | Type | Default | Notes |
|-------|------|---------|-------|
| `nama` | `str`/`none` | `none` | Blank → dotted |
| `nim` | `str`/`none` | `none` | Blank → dotted |
| `pejabat` | `array` of `dict(nama,jabatan,hp)` | `()` | Up to 3, missing → dotted |
| `entries` | `array` of `dict(hari_tanggal,datang,pulang,kegiatan,paraf)` | `none` | Blank table if `none` |
| `rows` | `int` | `19` | Min rows, padded |
| `logo` | `str` | `"assets/stmik_kuwera_logo.png"` | Path relative to `lib.typ` |

## Git Submodule (reuse in another repo)

```bash
git submodule add https://github.com/kagchi/documents.git documents
git submodule update --init
```

`main.typ` in your project:

```typ
#import "documents/lib.typ": daftar-hadir
#daftar-hadir(nama: "Ahmad", nim: "123")
```

```bash
typst compile main.typ
```

Pin to a tag/commit: `cd documents && git checkout v0.1.0 && cd .. && git add documents`.

Update: `git submodule update --remote documents`.

> Assets stay inside the submodule (`documents/assets/...`) so the logo resolves automatically.

## Online import?

Direct `#import "https://..."` is **not** supported in Typst (sandboxed). Use git submodule or upload the folder to typst.app. For a true one-liner, publish to Typst Packages (`@preview`) via `typst.toml` — not included yet but ready to add.
