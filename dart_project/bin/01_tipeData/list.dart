void main() {
  // List dengan tipe data int
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);

  // List dengan tipe data dynamic (bisa berbagai tipe)
  List<dynamic> campuran = [1, 'dua', 3.14, true];
  print('List campuran: $campuran');

  // Operasi pada List
  List<int> nilai = [75, 80, 85, 90];
  print('Nilai awal: $nilai');
  nilai.add(95); // Menambah elemen
  print('Setelah menambah: $nilai');
  nilai.remove(80); // Menghapus elemen
  print('Setelah menghapus: $nilai');

  // Mengakses elemen List
  print('Elemen pertama: ${nilai[0]}');
  print('Panjang List: ${nilai.length}');
  // List dengan tipe data String
  List<String> buah = ['Apel', 'Jeruk', 'Mangga', 'Pisang'];
  print('Daftar buah: $buah');
  
  // Mengubah elemen List
  buah[2] = 'Nanas';
  print('Daftar buah setelah diubah: $buah');


}



