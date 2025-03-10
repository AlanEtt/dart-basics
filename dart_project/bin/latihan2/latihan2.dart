import 'dart:io';
import 'dart:math';

// Fungsi untuk memvalidasi input numerik
int getValidIntInput(String prompt) {
  while (true) {
    stdout.write(prompt);
    try {
      String? input = stdin.readLineSync();
      if (input == null || input.isEmpty) {
        print('Error: Input tidak boleh kosong!');
        continue;
      }
      return int.parse(input);
    } catch (e) {
      print('Error: Mohon masukkan angka yang valid!');
      continue;
    }
  }
}

// Fungsi untuk mengecek kelayakan memilih dengan detail tambahan
void cekKelayakanMemilih() {
  print('\n=== Program 1: Cek Kelayakan Memilih (Versi Detail) ===');
  int usia = getValidIntInput('Masukkan usia Anda: ');

  if (usia >= 17) {
    print('Status: MEMENUHI SYARAT');
    print('✓ Anda dapat berpartisipasi dalam:');
    print('  - Pemilihan Umum (Pemilu)');
    print('  - Pemilihan Kepala Daerah (Pilkada)');
    print('  - Pemilihan Ketua RT/RW');
  } else {
    int tahunMenunggu = 17 - usia;
    print('Status: BELUM MEMENUHI SYARAT');
    print(
        '× Anda harus menunggu $tahunMenunggu tahun lagi untuk dapat memilih');
    print('  Saat ini Anda masih dalam kategori:');
    if (usia < 13) {
      print('  - Anak-anak');
    } else {
      print('  - Remaja');
    }
  }
}

// Fungsi untuk mengecek angka dengan detail tambahan
void cekAngkaDetail() {
  print('\n=== Program 2: Analisis Angka Detail ===');
  int angka = getValidIntInput('Masukkan sebuah angka: ');

  print('\nAnalisis angka $angka:');
  switch (angka.compareTo(0)) {
    case 1:
      print('► Jenis: Angka Positif');
      if (angka % 2 == 0) {
        print('► Kategori: Bilangan Genap');
      } else {
        print('► Kategori: Bilangan Ganjil');
      }
      if (isPrime(angka)) {
        print('► Sifat: Bilangan Prima');
      }
      break;
    case -1:
      print('► Jenis: Angka Negatif');
      print('► Nilai Absolut: ${angka.abs()}');
      break;
    case 0:
      print('► Jenis: Angka Nol');
      print('► Sifat: Netral');
      break;
  }
}

// Fungsi untuk mengecek bilangan prima
bool isPrime(int n) {
  if (n <= 1) return false;
  for (int i = 2; i <= n / 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

// Fungsi untuk menghitung faktorial dengan cara yang lebih detail
void hitungFaktorialDetail() {
  print('\n=== Program 3: Kalkulator Faktorial Detail ===');
  int n = getValidIntInput('Masukkan angka untuk menghitung faktorial: ');

  if (n < 0) {
    print('Error: Faktorial tidak didefinisikan untuk angka negatif!');
    return;
  }

  BigInt faktorial = BigInt.one;
  print('\nPerhitungan faktorial $n!:');
  print('1');

  for (int i = 2; i <= n; i++) {
    faktorial *= BigInt.from(i);
    print('× $i');
  }

  print('\nHasil: $faktorial');
  print('Jumlah digit hasil: ${faktorial.toString().length}');
}

// Fungsi untuk permainan tebak angka
void tebakAngka() {
  print('\n=== Program 4: Permainan Tebak Angka (1-10) ===');
  int targetAngka = Random().nextInt(10) + 1;
  int percobaan = 0;

  while (true) {
    int tebakan = getValidIntInput('Tebak angka (1-10): ');
    percobaan++;

    if (tebakan < 1 || tebakan > 10) {
      print('Mohon masukkan angka antara 1-10!');
      continue;
    }

    if (tebakan < targetAngka) {
      print('Terlalu rendah! ↑');
    } else if (tebakan > targetAngka) {
      print('Terlalu tinggi! ↓');
    } else {
      print(
          '🎉 Selamat! Anda menebak dengan benar dalam $percobaan percobaan!');
      break;
    }
  }
}

// Fungsi untuk manipulasi list
void manipulasiList() {
  print('\n=== Program 5: Manipulasi List Advanced ===');
  List<String> daftar = ['Satu', 'Dua', 'Tiga', 'Empat', 'Lima'];

  print('List awal: $daftar');
  print('\nOperasi yang tersedia:');
  print('1. Balik urutan');
  print('2. Urutkan (A-Z)');
  print('3. Tambah item');
  print('4. Hapus item');
  print('5. Cari item');

  int pilihan = getValidIntInput('Pilih operasi (1-5): ');

  switch (pilihan) {
    case 1:
      List<String> terbalik = daftar.reversed.toList();
      print('Hasil pembalikan: $terbalik');
      break;
    case 2:
      daftar.sort();
      print('Hasil pengurutan: $daftar');
      break;
    case 3:
      stdout.write('Masukkan item baru: ');
      String? itemBaru = stdin.readLineSync();
      if (itemBaru != null && itemBaru.isNotEmpty) {
        daftar.add(itemBaru);
        print('List setelah penambahan: $daftar');
      }
      break;
    case 4:
      if (daftar.isNotEmpty) {
        print('Index tersedia: 0-${daftar.length - 1}');
        int index = getValidIntInput('Masukkan index yang akan dihapus: ');
        if (index >= 0 && index < daftar.length) {
          String itemHapus = daftar.removeAt(index);
          print('Item "$itemHapus" telah dihapus');
          print('List setelah penghapusan: $daftar');
        } else {
          print('Index tidak valid!');
        }
      }
      break;
    case 5:
      stdout.write('Masukkan item yang dicari: ');
      String? itemCari = stdin.readLineSync();
      if (itemCari != null && itemCari.isNotEmpty) {
        int index = daftar
            .indexWhere((item) => item.toLowerCase() == itemCari.toLowerCase());
        if (index != -1) {
          print('Item "$itemCari" ditemukan pada index $index');
        } else {
          print('Item tidak ditemukan!');
        }
      }
      break;
    default:
      print('Operasi tidak valid!');
  }
}

// Fungsi untuk cek tahun kabisat
void cekTahunKabisat() {
  print('\n=== Program 6: Analisis Tahun Kabisat ===');
  int tahun = getValidIntInput('Masukkan tahun: ');

  bool isKabisat = (tahun % 4 == 0 && tahun % 100 != 0) || tahun % 400 == 0;

  print('\nAnalisis tahun $tahun:');
  if (isKabisat) {
    print('✓ $tahun adalah tahun kabisat');
    print('  - Memiliki 366 hari');
    print('  - Bulan Februari memiliki 29 hari');
  } else {
    print('× $tahun bukan tahun kabisat');
    print('  - Memiliki 365 hari');
    print('  - Bulan Februari memiliki 28 hari');
  }

  // Mencari tahun kabisat terdekat
  int tahunKabisatBerikutnya = tahun;
  while (!((tahunKabisatBerikutnya % 4 == 0 &&
          tahunKabisatBerikutnya % 100 != 0) ||
      tahunKabisatBerikutnya % 400 == 0)) {
    tahunKabisatBerikutnya++;
  }

  print('\nTahun kabisat terdekat: $tahunKabisatBerikutnya');
}

// Fungsi untuk analisis hari
void analisisHari() {
  print('\n=== Program 7: Analisis Hari ===');
  print('Masukkan hari (Senin-Minggu): ');
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print('Input tidak valid!');
    return;
  }

  String hari = input.toLowerCase();
  Map<String, List<String>> kategoriHari = {
    'kerja': ['senin', 'selasa', 'rabu', 'kamis', 'jumat'],
    'weekend': ['sabtu', 'minggu']
  };

  print('\nAnalisis hari $input:');
  if (kategoriHari['kerja']!.contains(hari)) {
    print('► Kategori: Hari Kerja');
    print('► Aktivitas umum: Bekerja/Sekolah');
    print('► Jam operasional normal: 08:00 - 17:00');
  } else if (kategoriHari['weekend']!.contains(hari)) {
    print('► Kategori: Akhir Pekan');
    print('► Aktivitas umum: Liburan/Rekreasi');
    print('► Jam operasional terbatas di beberapa tempat');
  } else {
    print('× Hari tidak valid!');
    print('  Mohon masukkan nama hari yang benar (Senin-Minggu)');
  }
}

// Fungsi untuk menghitung jumlah digit
void hitungDigit() {
  print('\n=== Program 8: Analisis Digit ===');
  int angka = getValidIntInput('Masukkan angka: ');

  // Konversi ke string untuk analisis digit
  String angkaStr = angka.abs().toString();
  int jumlahDigit = angkaStr.length;

  print('\nAnalisis angka $angka:');
  print('► Jumlah digit: $jumlahDigit');

  // Analisis setiap digit
  print('► Rincian digit:');
  Map<String, int> frekuensiDigit = {};
  for (int i = 0; i < angkaStr.length; i++) {
    String digit = angkaStr[i];
    frekuensiDigit[digit] = (frekuensiDigit[digit] ?? 0) + 1;
    print('  Posisi ${i + 1}: $digit');
  }

  // Tampilkan frekuensi digit
  print('► Frekuensi kemunculan:');
  frekuensiDigit.forEach((digit, frekuensi) {
    print('  Digit $digit: $frekuensi kali');
  });
}

// Fungsi untuk permainan tebak angka 1-100
void tebakAngka100() {
  print('\n=== Program 9: Permainan Tebak Angka (1-100) ===');
  int targetAngka = Random().nextInt(100) + 1;
  int percobaan = 0;
  int tebakan;

  print('Saya telah memilih angka antara 1 dan 100.');
  print('Cobalah untuk menebaknya!');

  do {
    tebakan = getValidIntInput('Masukkan tebakan Anda (1-100): ');
    percobaan++;

    if (tebakan < 1 || tebakan > 100) {
      print('Mohon masukkan angka antara 1-100!');
      continue;
    }

    if (tebakan < targetAngka) {
      print('Terlalu rendah! Coba angka yang lebih besar ↑');
      if (targetAngka - tebakan <= 5) {
        print('(Anda sudah sangat dekat!)');
      }
    } else if (tebakan > targetAngka) {
      print('Terlalu tinggi! Coba angka yang lebih kecil ↓');
      if (tebakan - targetAngka <= 5) {
        print('(Anda sudah sangat dekat!)');
      }
    }
  } while (tebakan != targetAngka);

  print('\n🎉 SELAMAT! 🎉');
  print('Anda berhasil menebak angka $targetAngka');
  print('Jumlah percobaan: $percobaan');

  // Memberikan pesan berdasarkan jumlah percobaan
  if (percobaan <= 5) {
    print('Luar biasa! Anda adalah penebak yang handal!');
  } else if (percobaan <= 10) {
    print('Bagus! Anda memiliki kemampuan menebak yang baik!');
  } else {
    print('Tetap semangat! Coba lagi untuk hasil yang lebih baik!');
  }
}

// Fungsi untuk analisis kata
void analisisKata() {
  print('\n=== Program 10: Analisis Kata ===');
  List<String> kataKata = [
    'Pemrograman',
    'Dart',
    'Flutter',
    'Mobile',
    'Aplikasi',
    'Pengembangan',
    'Perangkat',
    'Lunak'
  ];

  print('Daftar kata dan analisisnya:');
  print('=' * 40);

  for (String kata in kataKata) {
    int panjang = kata.length;
    String kategori = '';

    // Kategorisasi panjang kata
    if (panjang <= 4) {
      kategori = 'Kata Pendek';
    } else if (panjang <= 8) {
      kategori = 'Kata Sedang';
    } else {
      kategori = 'Kata Panjang';
    }

    // Hitung vokal dan konsonan
    int vokal = 0;
    int konsonan = 0;
    String hurufKecil = kata.toLowerCase();

    for (var huruf in hurufKecil.runes) {
      String char = String.fromCharCode(huruf);
      if ('aeiou'.contains(char)) {
        vokal++;
      } else if (char.contains(RegExp(r'[a-z]'))) {
        konsonan++;
      }
    }

    // Tampilkan hasil analisis
    print('\n► Kata: $kata');
    print('  - Panjang: $panjang huruf');
    print('  - Kategori: $kategori');
    print('  - Jumlah vokal: $vokal');
    print('  - Jumlah konsonan: $konsonan');
  }
}

void main() {
  while (true) {
    print('\n=== MENU PROGRAM ===');
    print('1. Cek Kelayakan Memilih');
    print('2. Analisis Angka');
    print('3. Kalkulator Faktorial');
    print('4. Permainan Tebak Angka (1-10)');
    print('5. Manipulasi List');
    print('6. Analisis Tahun Kabisat');
    print('7. Analisis Hari');
    print('8. Analisis Digit');
    print('9. Permainan Tebak Angka (1-100)');
    print('10. Analisis Kata');
    print('0. Keluar');

    int pilihan = getValidIntInput('\nPilih program (0-10): ');

    switch (pilihan) {
      case 0:
        print('Terima kasih telah menggunakan program ini!');
        return;
      case 1:
        cekKelayakanMemilih();
        break;
      case 2:
        cekAngkaDetail();
        break;
      case 3:
        hitungFaktorialDetail();
        break;
      case 4:
        tebakAngka();
        break;
      case 5:
        manipulasiList();
        break;
      case 6:
        cekTahunKabisat();
        break;
      case 7:
        analisisHari();
        break;
      case 8:
        hitungDigit();
        break;
      case 9:
        tebakAngka100();
        break;
      case 10:
        analisisKata();
        break;
      default:
        print('Pilihan tidak valid!');
    }

    print('\nTekan Enter untuk melanjutkan...');
    stdin.readLineSync();
  }
}
