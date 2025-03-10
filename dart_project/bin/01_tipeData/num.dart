void main() {
  // num adalah tipe data yang dapat menyimpan bilangan bulat maupun bilangan desimal.
  // Num, merupakan bilangan bulat dan bilangan pecahan. Tipe data ini bisa menjadi integer ataupun double, sesuai nanti data yang diinputkan.

  // Berikut contoh tipe data numerik di Dart 
  // 1. num - dapat menyimpan integer atau double
  num angka1 = 1000000;
  num angka2 = 3.14159;
  print('Tipe num: $angka1, $angka2');

  // 2. int - khusus bilangan bulat
  int bilBulat1 = 42;
  int bilBulat2 = -100;
  print('Tipe int: $bilBulat1, $bilBulat2');

  // 3. double - khusus bilangan desimal
  double desimal1 = 3.14;
  double desimal2 = -273.15;
  double desimal3 = 1.23e4; // notasi eksponensial
  print('Tipe double: $desimal1, $desimal2, $desimal3');

  // 4. Operasi matematika
  int a = 10;
  int b = 3;
  print('Pembagian int: ${a ~/ b}'); // hasil pembagian dibulatkan
  print('Pembagian double: ${a / b}'); // hasil pembagian desimal


}

