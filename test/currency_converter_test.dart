
import 'package:flutter_test/flutter_test.dart';
import '../experiments/experiment10.dart';

void main() {
  group('CurrencyConverter tests', () {
    final converter = CurrencyConverter();

    test('converts USD to INR correctly', () {
      expect(converter.convert(100, 83), 8300);
    });

    test('converts zero amount correctly', () {
      expect(converter.convert(0, 83), 0);
    });

    test('handles decimal amounts', () {
      expect(converter.convert(10.5, 2), 21);
    });

    test('rejects negative amounts', () {
      expect(
        () => converter.convert(-10, 83),
        throwsArgumentError,
      );
    });
  });
}
