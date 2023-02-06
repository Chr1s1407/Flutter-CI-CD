import 'dart:io';

class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;

  void doNothing() => sleep(const Duration(seconds: 2));
}
