# STMIK Kuwera — Documents (Typst)

Modular Typst templates. Current: **DAFTAR HADIR & KEGIATAN MAHASISWA DI TEMPAT MAGANG** — easy to add more.

## Structure

```
assets/stmik_kuwera_logo.png
src/
  shared/field.typ        # dotted/filled/field helpers
  shared/header.typ       # stmik-header(logo)
  shared/table.typ        # header-cell/body-cell
  templates/daftar-hadir-magang/
    lib.typ               # daftar-hadir-magang(...)
    example.typ
lib.typ                   # facade re-exporting all templates
daftar-hadir-magang.typ   # blank wrapper (backward compat)
example-filled.typ        # filled demo (root)
```

## Requirements

- `typst >= 0.11`

## Quick Start (blank)

```bash
typst compile daftar-hadir-magang.typ
typst watch daftar-hadir-magang.typ
# or modular
typst compile src/templates/daftar-hadir-magang/example.typ --root .
```

## Reusable Template

```typ
#import "lib.typ": daftar-hadir-magang

// blank
#daftar-hadir-magang()

// filled
#daftar-hadir-magang(
  nama: "Budi Santoso",
  nim: "20240001",
  pejabat: (
    (nama: "Siti Aminah", jabatan: "HR Manager", hp: "0812-3456-7890"),
    (nama: "Joko Widodo", jabatan: "Supervisor", hp: "0813-9876-5432"),
  ),
  entries: (
    (hari_tanggal: "Senin, 03 Feb 2026", datang: "08:00", pulang: "16:00", kegiatan: "Orientasi"),
  ),
  rows: 19,
)
```

Alias `daftar-hadir` still works: `#import "lib.typ": daftar-hadir` → same function.

### Parameters

| Param | Type | Default | Notes |
|-------|------|---------|-------|
| `nama` | `str`/`none` | `none` | Blank → dotted |
| `nim` | `str`/`none` | `none` | Blank → dotted |
| `pejabat` | `array` of `dict(nama,jabatan,hp)` | `()` | Up to 3 |
| `entries` | `array` of `dict(hari_tanggal,datang,pulang,kegiatan,paraf)` | `none` | `paraf` optional → blank for manual signature |
| `rows` | `int` | `19` | Min rows, padded |
| `logo` | `str` | `"../../../assets/..."` (from template) | Override path |

## Adding a New Template

```bash
mkdir -p src/templates/daftar-hadir-seminar
# copy lib.typ skeleton, implement new function daftar-hadir-seminar(...)
# add to lib.typ:
# import "src/templates/daftar-hadir-seminar/lib.typ": daftar-hadir-seminar
```

All templates reuse `src/shared/*` so header/logo style stays consistent.

## Git Submodule (reuse in another repo)

```bash
git submodule add https://github.com/<you>/documents.git documents
git submodule update --init
```

`main.typ`:

```typ
#import "documents/lib.typ": daftar-hadir-magang
#daftar-hadir-magang(nama: "Ahmad", nim: "123")

// or direct
#import "documents/src/templates/daftar-hadir-magang/lib.typ": daftar-hadir-magang
```

```bash
typst compile main.typ
typst compile documents/src/templates/daftar-hadir-magang/example.typ --root documents
```

Pin: `cd documents && git checkout v0.1.0 && cd .. && git add documents`.

## Online import?

`#import "https://..."` not supported. Use submodule or upload to typst.app. Publish to `@preview` via `typst.toml` for one-liner (not yet).
