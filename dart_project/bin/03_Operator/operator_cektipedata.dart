void main() {
  int a = 10;
  double b = 10.5;
  String c = 'Hello';
  bool d = true;

  print(a is int); // true karena a adalah int
  print(b is int); // false karena b adalah double
  print(c is int); // false karena c adalah string
  print(d is int); // false karena d adalah bool

  print(a is! int); // false karena a adalah int
  print(b is! int); // true karena b adalah double
  print(c is! int); // true karena c adalah string
  print(d is! int); // true karena d adalah bool
  
  
}
