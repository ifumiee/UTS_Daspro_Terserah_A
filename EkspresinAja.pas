program ekspresinAja;
uses crt;

var
  menu, zona, layanan, kelas, kg, i : integer;
  jlhPaket, jlhReguler, jlhKilat : integer;
  berat, sisa, nilaiBarang : real;
  tarifZona, pengali, persenDiskon : real;
  ongkir, diskon, asuransi, total, totalPendapatan : real;
  pakaiAsuransi : char;
  namaZona, namaLayanan, namaKelas : string;

begin
  totalPendapatan := 0;
  jlhPaket := 0;
  jlhReguler := 0;
  jlhKilat := 0;

  repeat
    clrscr;
    writeln('========================================');
    writeln('         EKSPEDISI PAKET CEPAT');
    writeln('========================================');
    writeln('1. Kirim paket');
    writeln('2. Rekap pengiriman');
    writeln('3. Keluar');
    write('Pilih menu (1-3): ');
    readln(menu);

    case menu of
      1:
        begin
        //Langkah 1
          clrscr;
          writeln('--- KIRIM PAKET (Langkah 1 dari 5: Berat) ---');
          writeln;
          writeln('Berat dihitung per kg penuh.');
          writeln('Contoh: 2.3 kg dihitung 3 kg (pakai titik, bukan koma).');
          writeln;
          while true do
          begin
            write('Berat paket (kg) : ');
            readln(berat);
            if berat <= 0 then
            begin
              writeln('Berat harus lebih dari 0!');
              continue;
            end;
            break;
          end;

          kg := 0;
          sisa := berat;
          while sisa > 0 do
          begin
            kg := kg + 1;
            sisa := sisa - 1;
          end;

        //Langkah 2
          clrscr;
          writeln('--- KIRIM PAKET (Langkah 2 dari 5: Zona) ---');
          writeln;
          writeln('Berat   : ', berat:0:1, ' kg (dihitung ', kg, ' kg)');
          writeln;
          writeln('Pilih zona tujuan:');
          writeln('  1. Dalam Kota   Rp  8.000 per kg');
          writeln('  2. Antar Kota   Rp 12.000 per kg');
          writeln('  3. Antar Pulau  Rp 20.000 per kg');
          writeln;
          while true do
          begin
            write('Zona tujuan (1-3) : ');
            readln(zona);
            case zona of
              1: begin tarifZona := 8000;  namaZona := 'Dalam Kota';  end;
              2: begin tarifZona := 12000; namaZona := 'Antar Kota';  end;
              3: begin tarifZona := 20000; namaZona := 'Antar Pulau'; end;
            else
              begin
                writeln('Zona tidak valid!');
                continue;
              end;
            end;
            break;
          end;

          //Langkah 3
          clrscr;
          writeln('--- KIRIM PAKET (Langkah 3 dari 5: Layanan) ---');
          writeln;
          writeln('Berat   : ', berat:0:1, ' kg (dihitung ', kg, ' kg)');
          writeln('Zona    : ', namaZona);
          writeln;
          writeln('Pilih layanan:');
          writeln('  1. Reguler : pengiriman biasa, ongkir sesuai tarif zona');
          writeln('  2. Kilat   : pengiriman lebih cepat, ongkir 1,5 kali lipat');
          writeln('               (50% lebih mahal dari Reguler)');
          writeln;
          while true do
          begin
            write('Layanan (1-2) : ');
            readln(layanan);
            case layanan of
              1: begin pengali := 1;   namaLayanan := 'Reguler'; end;
              2: begin pengali := 1.5; namaLayanan := 'Kilat';   end;
            else
              begin
                writeln('Layanan tidak valid!');
                continue;
              end;
            end;
            break;
          end;

        //Langkah 4
          clrscr;
          writeln('--- KIRIM PAKET (Langkah 4 dari 5: Asuransi) ---');
          writeln;
          writeln('Berat   : ', berat:0:1, ' kg (dihitung ', kg, ' kg)');
          writeln('Zona    : ', namaZona);
          writeln('Layanan : ', namaLayanan);
          writeln;
          writeln('Asuransi melindungi barang jika rusak atau hilang.');
          writeln('Biayanya 1% dari nilai barang.');
          writeln;
          asuransi := 0;
          while true do
          begin
            write('Pakai asuransi? (y/n) : ');
            readln(pakaiAsuransi);
            if (pakaiAsuransi = 'y') or (pakaiAsuransi = 'Y') then
            begin
              write('Nilai barang (Rp)     : ');
              readln(nilaiBarang);
              if nilaiBarang <= 0 then
              begin
                writeln('Nilai barang harus lebih dari 0!');
                continue;
              end;
              asuransi := nilaiBarang * 0.01;
              break;
            end
            else if (pakaiAsuransi = 'n') or (pakaiAsuransi = 'N') then
            begin
              asuransi := 0;
              break;
            end
            else
              writeln('Masukkan y atau n!');
          end;

        //Langkah 5: 
          clrscr;
          writeln('--- KIRIM PAKET (Langkah 5 dari 5: Pelanggan) ---');
          writeln;
          writeln('Berat    : ', berat:0:1, ' kg (dihitung ', kg, ' kg)');
          writeln('Zona     : ', namaZona);
          writeln('Layanan  : ', namaLayanan);
          if asuransi > 0 then
            writeln('Asuransi : Ya (Rp ', asuransi:0:0, ')')
          else
            writeln('Asuransi : Tidak');
          writeln;
          writeln('Pilih kelas pelanggan (diskon dari ongkir):');
          writeln('  1. Reguler  diskon  0%');
          writeln('  2. Silver   diskon  5%');
          writeln('  3. Gold     diskon 10%');
          writeln;
          while true do
          begin
            write('Kelas pelanggan (1-3) : ');
            readln(kelas);
            case kelas of
              1: begin persenDiskon := 0;    namaKelas := 'Reguler'; end;
              2: begin persenDiskon := 0.05; namaKelas := 'Silver';  end;
              3: begin persenDiskon := 0.10; namaKelas := 'Gold';    end;
            else
              begin
                writeln('Kelas tidak valid!');
                continue;
              end;
            end;
            break;
          end;

          ongkir := kg * tarifZona * pengali;
          diskon := ongkir * persenDiskon;
          total := ongkir - diskon + asuransi;

          totalPendapatan := totalPendapatan + total;
          jlhPaket := jlhPaket + 1;
          if layanan = 1 then
            jlhReguler := jlhReguler + 1
          else
            jlhKilat := jlhKilat + 1;

          clrscr;
          for i := 1 to 40 do write('=');
          writeln;
          writeln('               RESI PENGIRIMAN');
          for i := 1 to 40 do write('=');
          writeln;
          writeln('Nomor paket     : ', jlhPaket);
          writeln('Berat asli      : ', berat:0:1, ' kg');
          writeln('Berat dibulatkan: ', kg, ' kg');
          writeln('Zona            : ', namaZona);
          writeln('Layanan         : ', namaLayanan);
          writeln('Pelanggan       : ', namaKelas);
          for i := 1 to 40 do write('-');
          writeln;
          writeln('Ongkir          : Rp ', ongkir:0:0);
          writeln('Diskon          : Rp ', diskon:0:0);
          writeln('Asuransi        : Rp ', asuransi:0:0);
          for i := 1 to 40 do write('-');
          writeln;
          writeln('TOTAL BAYAR     : Rp ', total:0:0);
          for i := 1 to 40 do write('=');
          writeln;
          writeln;
          write('Tekan Enter untuk kembali ke menu...');
          readln;
        end;

      2:
        begin
          clrscr;
          writeln('--- REKAP PENGIRIMAN ---');
          writeln;
          writeln('Jumlah paket       : ', jlhPaket);
          writeln('  Layanan reguler  : ', jlhReguler);
          writeln('  Layanan kilat    : ', jlhKilat);
          writeln('Total pendapatan   : Rp ', totalPendapatan:0:0);
          writeln;
          write('Tekan Enter untuk kembali ke menu...');
          readln;
        end;

      3:
        writeln('Terima kasih sudah menggunakan Ekspedisi Paket Cepat!');

    else
      begin
        writeln('Menu tidak valid, coba lagi.');
        write('Tekan Enter untuk kembali ke menu...');
        readln;
      end;
    end;
  until menu = 3;
end.
