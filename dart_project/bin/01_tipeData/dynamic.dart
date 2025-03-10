
void main() {
  // Dynamic adalah tipe data yang dapat berubah-ubah sesuai nilai yang diberikan
  dynamic nilai = 100; // nilai awal bertipe int
  print('Nilai awal (int): $nilai');

  nilai = "seratus"; // nilai berubah menjadi String
  print('Nilai sekarang (String): $nilai');

  nilai = 99.99; // nilai berubah menjadi double
  print('Nilai sekarang (double): $nilai');

  nilai = true; // nilai berubah menjadi boolean
  print('Nilai sekarang (boolean): $nilai');

  // Contoh penggunaan dynamic dalam List
  dynamic dataCampuran = [42, "Alan", 3.14, false];
  print('Data campuran: $dataCampuran');

  // Contoh penggunaan dynamic dalam Map
  dynamic biodata = {
    'nama': 'Rizki Alan',
    'umur': 20,
    'ipk': 3.9,
    'aktif': true
  };
  print('Biodata: $biodata');
}
