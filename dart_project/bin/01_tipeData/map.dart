void main() {
  // Map dengan tipe data String sebagai kunci dan int sebagai nilai
  Map<String, int> nilaiSiswa = {
    'Alan': 85,
    'Ahkyar': 90,
  };
  nilaiSiswa['Bob'] = 88; // Menambahkan elemen baru
  print('Nilai siswa: $nilaiSiswa');

  // Map dengan tipe data dynamic (bisa berbagai tipe)
  Map<String, dynamic> data = {
    'nama': 'Alan',
    'usia': 20,
    'alamat': 'Jl. RMP No. 123',
    'status': true,
  };
  print('Data: $data');

  // Operasi pada Map
  print('Setelah menambah: $nilaiSiswa');
  nilaiSiswa.remove('Ahkyar'); // Menghapus elemen
  print('Setelah menghapus: $nilaiSiswa');

  // Mengakses elemen Map
  print('Nilai John: ${nilaiSiswa['John']}');
  print('Usia: ${data['usia']}');


}
