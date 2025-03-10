void main() {
  // var adalah tipe data yang dapat berubah-ubah sesuai nilai yang diberikan
  var nama = "Rizki Alan";
  var umur = 20;
  var ipk = 3.9;
  var aktif = true;
  var nilai = 100;
  var alamat = "Jl. RMP";
  var noHp = "081234567890";
  var email = "alanetkaji@gmail.com";
  var jenisKelamin = "Laki-laki";

  print('Nama: $nama');
  print('Umur: $umur');
  print('IPK: $ipk');
  print('Aktif: $aktif');
  print('Nilai: $nilai');
  print('Alamat: $alamat');
  print('No HP: $noHp');
  print('Email: $email');
  print('Jenis Kelamin: $jenisKelamin');
  // Contoh penggunaan var dalam List
  var dataCampuran = [221240001238, "Alan", 3.14, false];
  print('Data campuran: $dataCampuran');

  // Contoh penggunaan var dalam Map
  var biodata = {
    'nama': 'Rizki Alan',
    'umur': 20,
    'ipk': 3.9,
    'aktif': true
  };
  print('Biodata: $biodata');

  // Contoh var dengan tipe data yang sama
  var angka = 10;
  // angka = "sepuluh"; // Error: tipe data tidak bisa berubah setelah dideklarasikan
  angka = 20; // OK: masih bertipe int
  print('Angka: $angka');

    
}

