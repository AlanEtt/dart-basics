import 'dart:io';

void main() {
  // 1. Mencetak nama
  print('\n=== Program 1: Mencetak Nama ===');
  print('Rizki Alan Habibi');

  // 2. Mencetak nama dengan tanda kutip
  print('\n=== Program 2: Input Nama dengan Tanda Kutip tunggal dan ganda ===');
  stdout.write('Masukkan nama Anda: ');
  String? nama = stdin.readLineSync();

  if (nama == null || nama.trim().isEmpty) {
    print('Error: Nama harus diisi!');
  } else {
    print('Hello, saya "$nama"');
    print("Hello, saya '$nama'");
  }

  // 3. Konstanta dengan nilai 7
  print('\n=== Program 3: Konstanta ===');
  const int nilaiTetap = 7;
  print('Nilai konstanta: $nilaiTetap');

  // 4. Menghitung bunga sederhana
  print('\n=== Program 4: Menghitung Bunga Sederhana ===');
  stdout.write('Masukkan pokok (p): ');
  double p = double.parse(stdin.readLineSync()!);
  stdout.write('Masukkan waktu (t): ');
  double t = double.parse(stdin.readLineSync()!);
  stdout.write('Masukkan suku bunga (r): ');
  double r = double.parse(stdin.readLineSync()!);
  double bunga = (p * t * r) / 100;
  print('Bunga sederhana: $bunga');

  // 5. Mencetak persegi
  print('\n=== Program 5: Mencetak Persegi ===');
  stdout.write('Masukkan ukuran persegi: ');
  int ukuran = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < ukuran; i++) {
    for (int j = 0; j < ukuran; j++) {
      stdout.write('* ');
    }
    print('');
  }

  // 6. Mencetak nama lengkap
  print('\n=== Program 6: Nama Lengkap ===');
  stdout.write('Masukkan nama depan: ');
  String? namaDepan = stdin.readLineSync();
  stdout.write('Masukkan nama belakang: ');
  String? namaBelakang = stdin.readLineSync();
  print('Nama lengkap: $namaDepan $namaBelakang');

  // 7. Hasil bagi dan sisa
  print('\n=== Program 7: Hasil Bagi dan Sisa ===');
  stdout.write('Masukkan bilangan pertama: ');
  int bil1 = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan bilangan kedua: ');
  int bil2 = int.parse(stdin.readLineSync()!);
  print('Hasil bagi: ${bil1 ~/ bil2}');
  print('Sisa: ${bil1 % bil2}');

  // 8. Menukar dua bilangan
  print('\n=== Program 8: Menukar Bilangan ===');
  int a = 5, b = 10;
  print('Sebelum ditukar: a = $a, b = $b');
  int temp = a;
  a = b;
  b = temp;
  print('Setelah ditukar: a = $a, b = $b');

  // 9. Menghapus spasi dari String
  print('\n=== Program 9: Menghapus Spasi ===');
  String teksSpasi = 'Ini adalah contoh teks dengan spasi';
  String tanpaSpasi = teksSpasi.replaceAll(' ', '');
  print('Teks asli: $teksSpasi');
  print('Teks tanpa spasi: $tanpaSpasi');

  // 10. Mengkonversi String ke int
  print('\n=== Program 10: Konversi String ke Int ===');
  String angkaString = '123';
  int angkaInt = int.parse(angkaString);
  print('String: $angkaString');
  print('Integer: $angkaInt');

  // 11. Pembagian tagihan restoran
  print('\n=== Program 11: Pembagian Tagihan ===');
  stdout.write('Masukkan total tagihan: ');
  double totalTagihan = double.parse(stdin.readLineSync()!);
  stdout.write('Masukkan jumlah orang: ');
  int jumlahOrang = int.parse(stdin.readLineSync()!);
  double bagianPerOrang = totalTagihan / jumlahOrang;
  print('Setiap orang harus membayar: Rp${bagianPerOrang.toStringAsFixed(2)}');
}
