# EkspresinAja — Sistem Ekspedisi / Pengiriman Paket

Proyek UTS Dasar Pemrograman Semester Ganjil T.A. 2026/2027.

## Anggota Kelompok

Kelompok: **[Nama Kelompok]**

| No | Nama | NIM | KOM | Lab |
|----|------|-----|-----|-----|
| 1 | Gabriella Agatha Harefa  | 261401108 | A | 2 |
| 2 | Yuga Aqilla Pratama | 261401142 | A | 2 |
| 3 | Melisa Claudyah Hutauruk | 261401111 | A | 2 |

## Fitur Utama

Program punya 3 menu utama: **1. Kirim paket**, **2. Rekap pengiriman**, **3. Keluar**.

### 1. Kirim Paket
- **Input berat dan validasi.** Berat harus lebih dari 0. Kalau tidak valid, `continue` mengulang input; kalau valid, `break` keluar dari loop.
- **Pembulatan berat per kg.** Berat dikurangi 1 berulang kali dengan `while` sambil menambah hitungan kg, sehingga 2,3 kg dihitung 3 kg.
- **Zona tujuan (`case`).** Dalam Kota Rp8.000/kg, Antar Kota Rp12.000/kg, Antar Pulau Rp20.000/kg.
- **Jenis layanan (`case`).** Reguler (x1) atau Kilat (x1,5).
- **Asuransi opsional (`if`).** Jika dipilih, biayanya 1% dari nilai barang.
- **Diskon pelanggan (`case`).** Reguler 0%, Silver 5%, Gold 10% dari ongkir.
- **Resi.** Menampilkan rincian ongkir, diskon, asuransi, dan total bayar.

Rumus: `ongkir = kg x tarif zona x pengali layanan`, lalu `total = ongkir - diskon + asuransi`.

### 2. Rekap Pengiriman
Menampilkan jumlah paket (reguler dan kilat) serta total pendapatan, dihitung dengan variabel akumulator.

### 3. Keluar
Mengakhiri program.

## Materi yang Digunakan

| Syarat | Penerapan di program |
|--------|----------------------|
| Konsep dasar dan I/O | `write`, `writeln`, `readln`, format angka `:0:0`, variabel `integer`, `real`, `char`, `string` |
| Pengondisian | `if-then-else`, nested-if, `case-of` |
| Perulangan (min. 2 jenis) | `for-to-do`, `while-do`, `repeat-until` |
| Break / continue | Validasi input di setiap loop `while true` |
| Menu interaktif | Menu utama dengan `repeat-until` |

