program Ekspedisi;

{ Ekspedisi / Pengiriman Paket
  Hanya memakai: I/O, if/case, for/while/repeat-until, break/continue, menu repeat-until.
  Tanpa array, procedure/function, dan unit tambahan. }

var
  menu, zona, layanan, kelas, kg, i : integer;
  jmlPaket, jmlReguler, jmlKilat : integer;
  berat, sisa, nilaiBarang : real;
  tarifZona, pengali, persenDiskon : real;
  ongkir, diskon, asuransi, total, totalPendapatan : real;
  pakaiAsuransi : char;
  namaZona, namaLayanan, namaKelas : string;

begin
  totalPendapatan := 0;
  jmlPaket := 0;
  jmlReguler := 0;
  jmlKilat := 0;

  repeat
    writeln;
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
          writeln;
          writeln('--- KIRIM PAKET ---');

          { Input berat (validasi: harus > 0) }
          while true do
          begin
            write('Berat paket (kg)             : ');
            readln(berat);
            if berat <= 0 then
            begin
              writeln('Berat harus lebih dari 0!');
              continue;
            end;
            break;
          end;

          { Pembulatan berat ke atas per kg tanpa fungsi round/ceil }
          kg := 0;
          sisa := berat;
          while sisa > 0 do
          begin
            kg := kg + 1;
            sisa := sisa - 1;
          end;

          { Pilih zona tujuan }
          while true do
          begin
            writeln('Zona: 1. Dalam Kota  2. Antar Kota  3. Antar Pulau');
            write('Zona tujuan (1-3)            : ');
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

          { Pilih layanan }
          while true do
          begin
            writeln('Layanan: 1. Reguler  2. Kilat (x1,5)');
            write('Layanan (1-2)                : ');
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

          { Asuransi opsional (1% dari nilai barang) }
          asuransi := 0;
          while true do
          begin
            write('Pakai asuransi? (y/n)        : ');
            readln(pakaiAsuransi);
            if (pakaiAsuransi = 'y') or (pakaiAsuransi = 'Y') then
            begin
              write('Nilai barang (Rp)            : ');
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

          { Kelas pelanggan -> diskon dari ongkir }
          while true do
          begin
            writeln('Pelanggan: 1. Reguler (0%)  2. Silver (5%)  3. Gold (10%)');
            write('Kelas pelanggan (1-3)        : ');
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

          { Perhitungan }
          ongkir := kg * tarifZona * pengali;
          diskon := ongkir * persenDiskon;
          total := ongkir - diskon + asuransi;

          { Rekap }
          totalPendapatan := totalPendapatan + total;
          jmlPaket := jmlPaket + 1;
          if layanan = 1 then
            jmlReguler := jmlReguler + 1
          else
            jmlKilat := jmlKilat + 1;

          { Cetak resi }
          writeln;
          for i := 1 to 40 do write('=');
          writeln;
          writeln('               RESI PENGIRIMAN');
          for i := 1 to 40 do write('=');
          writeln;
          writeln('Nomor paket     : ', jmlPaket);
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
        end;

      2:
        begin
          writeln;
          writeln('--- REKAP PENGIRIMAN ---');
          writeln('Jumlah paket       : ', jmlPaket);
          writeln('  Layanan reguler  : ', jmlReguler);
          writeln('  Layanan kilat    : ', jmlKilat);
          writeln('Total pendapatan   : Rp ', totalPendapatan:0:0);
        end;

      3:
        writeln('Terima kasih sudah menggunakan Ekspedisi Paket Cepat!');

    else
      writeln('Menu tidak valid, coba lagi.');
    end;
  until menu = 3;
end.
