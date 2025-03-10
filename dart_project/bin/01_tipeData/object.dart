void main() {
  // Object adalah tipe data yang dapat berisi nilai dari semua tipe data lainnya
  Object nilai = 100; // nilai awal bertipe int
  print('Nilai awal (int): $nilai');

  nilai = "seratus"; // nilai berubah menjadi String
  print('Nilai sekarang (String): $nilai');

  nilai = 99.99; // nilai berubah menjadi double
  print('Nilai sekarang (double): $nilai');

  nilai = true; // nilai berubah menjadi boolean
  print('Nilai sekarang (boolean): $nilai');

  // Contoh penggunaan object dalam List
  Object dataCampuran = [221240001238, "Alan", 3.14, false];
  print('Data campuran: $dataCampuran');
}
