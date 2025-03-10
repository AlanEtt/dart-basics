void main() {
  int a = 10;
  int b = 20;
  int c = 30;
  
  print(a < b && b < c); // true karena a < b dan b < c
  print(a < b || b > c); // true karena a < b
  print(!(a < b)); // false karena a < b
  
}
