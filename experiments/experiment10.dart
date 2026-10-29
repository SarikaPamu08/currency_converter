
import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverter {
  double convert(double amount, double rate) {
    if (amount < 0 || rate < 0) {
      throw ArgumentError('Amount and rate cannot be negative.');
    }

    return amount * rate;
  }
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ConversionTestScreen(),
    );
  }
}

class ConversionTestScreen extends StatelessWidget {
  const ConversionTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final converter = CurrencyConverter();
    final result = converter.convert(100, 83);

    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 60, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              'Currency Conversion',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12),
            Text(
              '100 USD = ${result.toStringAsFixed(2)} INR',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
