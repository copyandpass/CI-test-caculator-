// test/calculator_test.dart
import 'package:flutter_test/flutter_test.dart';

// 계산 로직을 담당하는 클래스 (예시)
class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b == 0) throw ArgumentError('Cannot divide by zero');
    return a / b;
  }
}

void main() {
  group('Calculator', () {
    test('add() should return the sum of two numbers', () {
      final calculator = Calculator();
      expect(calculator.add(5, 3), 8);
    });

    test('divide() should throw an error when dividing by zero', () {
      final calculator = Calculator();
      expect(() => calculator.divide(10, 0), throwsA(isA<ArgumentError>()));
    });
  });
}