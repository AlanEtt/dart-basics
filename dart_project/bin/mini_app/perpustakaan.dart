import 'dart:io';

// Kelas untuk menyimpan data buku
class Buku {
  String id;
  String judul;
  String penulis;
  bool tersedia;

  Buku(this.id, this.judul, this.penulis, this.tersedia);
}

// Kelas untuk menyimpan data peminjaman
class Peminjaman {
  String idBuku;
  String namaPeminjam;
  DateTime tanggalPinjam;
  DateTime? tanggalKembali;

  Peminjaman(this.idBuku, this.namaPeminjam, this.tanggalPinjam);
}

class Perpustakaan {
  List<Buku> daftarBuku = [];
  List<Peminjaman> daftarPeminjaman = [];

  // Constructor untuk menginisialisasi beberapa buku
  Perpustakaan() {
    daftarBuku.addAll([
      Buku('B001', 'Pemrograman Dart', 'Alan Dart', true),
      Buku('B002', 'Flutter untuk Pemula', 'Budi Flutter', true),
      Buku('B003', 'Mobile Development', 'Citra Mobile', true),
      Buku('B004', 'Database Design', 'Diana DB', true),
      Buku('B005', 'Web Programming', 'Eko Web', true),
    ]);
  }

  // Menampilkan menu utama
  void tampilkanMenu() {
    while (true) {
      print('\n=== SISTEM MANAJEMEN PERPUSTAKAAN ===');
      print('1. Lihat Daftar Buku');
      print('2. Cari Buku');
      print('3. Pinjam Buku');
      print('4. Kembalikan Buku');
      print('5. Lihat Riwayat Peminjaman');
      print('6. Tambah Buku Baru');
      print('7. Keluar');

      stdout.write('\nPilih menu (1-7): ');
      String? pilihan = stdin.readLineSync();

      switch (pilihan) {
        case '1':
          lihatDaftarBuku();
          break;
        case '2':
          cariBuku();
          break;
        case '3':
          pinjamBuku();
          break;
        case '4':
          kembalikanBuku();
          break;
        case '5':
          lihatRiwayatPeminjaman();
          break;
        case '6':
          tambahBuku();
          break;
        case '7':
          print('\nTerima kasih telah menggunakan sistem perpustakaan!');
          return;
        default:
          print('\nPilihan tidak valid!');
      }
    }
  }

  // Menampilkan daftar buku
  void lihatDaftarBuku() {
    print('\n=== DAFTAR BUKU ===');
    print('ID\tJudul\t\t\tPenulis\t\tStatus');
    print('------------------------------------------------');
    for (var buku in daftarBuku) {
      String status = buku.tersedia ? 'Tersedia' : 'Dipinjam';
      print(
          '${buku.id}\t${buku.judul.padRight(20)}\t${buku.penulis.padRight(10)}\t$status');
    }
  }

  // Mencari buku berdasarkan judul
  void cariBuku() {
    stdout.write('\nMasukkan judul buku yang dicari: ');
    String? keyword = stdin.readLineSync()?.toLowerCase();

    print('\n=== HASIL PENCARIAN ===');
    bool ditemukan = false;

    for (var buku in daftarBuku) {
      if (buku.judul.toLowerCase().contains(keyword!)) {
        print('ID: ${buku.id}');
        print('Judul: ${buku.judul}');
        print('Penulis: ${buku.penulis}');
        print('Status: ${buku.tersedia ? "Tersedia" : "Dipinjam"}');
        print('------------------------');
        ditemukan = true;
      }
    }

    if (!ditemukan) {
      print('Buku tidak ditemukan!');
    }
  }

  // Meminjam buku
  void pinjamBuku() {
    stdout.write('\nMasukkan ID buku yang akan dipinjam: ');
    String? idBuku = stdin.readLineSync();

    var buku = daftarBuku.firstWhere((b) => b.id == idBuku,
        orElse: () => Buku('', '', '', false));

    if (buku.id.isEmpty) {
      print('Buku tidak ditemukan!');
      return;
    }

    if (!buku.tersedia) {
      print('Maaf, buku sedang dipinjam!');
      return;
    }

    stdout.write('Masukkan nama peminjam: ');
    String? namaPeminjam = stdin.readLineSync();

    buku.tersedia = false;
    var peminjaman = Peminjaman(idBuku!, namaPeminjam!, DateTime.now());
    daftarPeminjaman.add(peminjaman);

    print('\nPeminjaman berhasil!');
    print(
        'Tanggal peminjaman: ${peminjaman.tanggalPinjam.toString().split(' ')[0]}');
  }

  // Mengembalikan buku
  void kembalikanBuku() {
    stdout.write('\nMasukkan ID buku yang akan dikembalikan: ');
    String? idBuku = stdin.readLineSync();

    var peminjaman = daftarPeminjaman.lastWhere(
        (p) => p.idBuku == idBuku && p.tanggalKembali == null,
        orElse: () => Peminjaman('', '', DateTime.now()));

    if (peminjaman.idBuku.isEmpty) {
      print('Data peminjaman tidak ditemukan!');
      return;
    }

    var buku = daftarBuku.firstWhere((b) => b.id == idBuku);
    buku.tersedia = true;
    peminjaman.tanggalKembali = DateTime.now();

    print('\nPengembalian berhasil!');
    print(
        'Tanggal pengembalian: ${peminjaman.tanggalKembali.toString().split(' ')[0]}');
  }

  // Melihat riwayat peminjaman
  void lihatRiwayatPeminjaman() {
    print('\n=== RIWAYAT PEMINJAMAN ===');
    if (daftarPeminjaman.isEmpty) {
      print('Belum ada riwayat peminjaman.');
      return;
    }

    for (var peminjaman in daftarPeminjaman) {
      var buku = daftarBuku.firstWhere((b) => b.id == peminjaman.idBuku);
      print('ID Buku: ${peminjaman.idBuku}');
      print('Judul: ${buku.judul}');
      print('Peminjam: ${peminjaman.namaPeminjam}');
      print(
          'Tanggal Pinjam: ${peminjaman.tanggalPinjam.toString().split(' ')[0]}');
      if (peminjaman.tanggalKembali != null) {
        print(
            'Tanggal Kembali: ${peminjaman.tanggalKembali.toString().split(' ')[0]}');
      } else {
        print('Status: Masih dipinjam');
      }
      print('------------------------');
    }
  }

  // Menambah buku baru
  void tambahBuku() {
    stdout.write('\nMasukkan ID buku baru: ');
    String? id = stdin.readLineSync();

    // Cek apakah ID sudah ada
    if (daftarBuku.any((buku) => buku.id == id)) {
      print('ID buku sudah ada!');
      return;
    }

    stdout.write('Masukkan judul buku: ');
    String? judul = stdin.readLineSync();

    stdout.write('Masukkan nama penulis: ');
    String? penulis = stdin.readLineSync();

    var bukuBaru = Buku(id!, judul!, penulis!, true);
    daftarBuku.add(bukuBaru);

    print('\nBuku berhasil ditambahkan!');
  }
}

void main() {
  var perpustakaan = Perpustakaan();
  perpustakaan.tampilkanMenu();
}
