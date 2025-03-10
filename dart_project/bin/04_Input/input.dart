import 'dart:io';

void main() {
  // Contoh String - Tipe data untuk teks
  print('Masukkan nama kamu: ');
  String nama = stdin.readLineSync()!;
  print('Nama adalah tipe data ${nama is String}\n');
  
  // Contoh Integer - Tipe data untuk bilangan bulat
  print('Masukkan umur kamu: ');
  int umur = int.parse(stdin.readLineSync()!);
  print('Umur adalah tipe data ${umur is int}\n');
  
  // Contoh Double - Tipe data untuk bilangan desimal
  print('Masukkan tinggi badan kamu (dalam cm): ');
  double tinggiBadan = double.parse(stdin.readLineSync()!);
  print('Tinggi badan adalah tipe data ${tinggiBadan is double}\n');
  
  // Contoh Double - Tipe data untuk bilangan desimal
  print('Masukkan berat badan kamu (dalam kg): ');
  double beratBadan = double.parse(stdin.readLineSync()!);
  print('Berat badan adalah tipe data ${beratBadan is double}\n');
  
  // Contoh Boolean - Tipe data untuk nilai true/false
  print('Apakah kamu sudah lulus? (true/false): ');
  bool lulus = stdin.readLineSync()!.toLowerCase() == 'true';
  print('Status kelulusan adalah tipe data ${lulus is bool}\n');
  
  // Contoh String - Tipe data untuk teks
  print('Masukkan nilai kamu (A/B/C/D/E): ');
  String nilai = stdin.readLineSync()!;
  print('Nilai adalah tipe data ${nilai is String}\n');
  
  print('\n=== Data Diri ===');
  print('Nama: $nama (${nama.runtimeType})');
  print('Umur: $umur tahun (${umur.runtimeType})');
  print('Tinggi Badan: $tinggiBadan cm (${tinggiBadan.runtimeType})');
  print('Berat Badan: $beratBadan kg (${beratBadan.runtimeType})');
  print('Status Kelulusan: $lulus (${lulus.runtimeType})');
  print('Nilai: $nilai (${nilai.runtimeType})');
}

