
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ExchangeRateScreen(),
    );
  }
}

class ExchangeRateScreen extends StatefulWidget {
  const ExchangeRateScreen({super.key});

  @override
  State<ExchangeRateScreen> createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen> {
  late Future<Map<String, dynamic>> _ratesFuture;

  @override
  void initState() {
    super.initState();
    _ratesFuture = fetchExchangeRates();
  }

  Future<Map<String, dynamic>> fetchExchangeRates() async {
    final url = Uri.parse(
      'https://open.er-api.com/v6/latest/USD',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      if (data['result'] != 'success') {
        throw Exception('The API could not provide exchange rates.');
      }

      return data['rates'] as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load exchange rates.');
    }
  }

  void refreshRates() {
    setState(() {
      _ratesFuture = fetchExchangeRates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Exchange Rates'),
        actions: [
          IconButton(
            onPressed: refreshRates,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh rates',
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _ratesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Unable to load exchange rates.'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: refreshRates,
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          final rates = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Base Currency: USD',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _rateTile('Indian Rupee (INR)', rates['INR']),
              _rateTile('Euro (EUR)', rates['EUR']),
              _rateTile('British Pound (GBP)', rates['GBP']),
              _rateTile('Japanese Yen (JPY)', rates['JPY']),
              _rateTile('Canadian Dollar (CAD)', rates['CAD']),
            ],
          );
        },
      ),
    );
  }

  Widget _rateTile(String currency, dynamic rate) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.currency_exchange),
        title: Text(currency),
        subtitle: Text(
          rate == null ? 'Rate unavailable' : '1 USD = $rate',
        ),
      ),
    );
  }
}
