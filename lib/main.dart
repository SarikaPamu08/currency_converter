
import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const CurrencyConverterPage(),
    );
  }
}

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() =>
      _CurrencyConverterPageState();
}

class _CurrencyConverterPageState
    extends State<CurrencyConverterPage> {
  final TextEditingController amountController =
      TextEditingController(text: '100');

  final Map<String, double> rates = {
    'USD': 1.0,
    'INR': 83.50,
    'EUR': 0.92,
    'GBP': 0.79,
    'JPY': 150.0,
  };

  String fromCurrency = 'USD';
  String toCurrency = 'INR';
  double? convertedAmount;
  String? errorMessage;

  void convertCurrency() {
    final amount = double.tryParse(amountController.text.trim());

    if (amount == null || amount < 0) {
      setState(() {
        convertedAmount = null;
        errorMessage = 'Please enter a valid non-negative amount.';
      });
      return;
    }

    // Rates are illustrative and use USD as the base currency.
    final result = amount / rates[fromCurrency]! * rates[toCurrency]!;

    setState(() {
      convertedAmount = result;
      errorMessage = null;
    });
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF172554),
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.currency_exchange, size: 28),
            SizedBox(width: 12),
            Text(
              'Currency Converter',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.public,
                      size: 58,
                      color: Color(0xFF2563EB),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Convert your money',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF172554),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Simple, fast and convenient currency conversion.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Amount',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: amountController,
                      keyboardType:
                          const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter amount',
                        prefixIcon: const Icon(Icons.payments_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'From',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: fromCurrency,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: rates.keys.map((currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => fromCurrency = value);
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: IconButton.filled(
                        tooltip: 'Swap currencies',
                        onPressed: () {
                          setState(() {
                            final previous = fromCurrency;
                            fromCurrency = toCurrency;
                            toCurrency = previous;
                          });
                        },
                        icon: const Icon(Icons.swap_vert),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'To',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: toCurrency,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: rates.keys.map((currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => toCurrency = value);
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: convertCurrency,
                      icon: const Icon(Icons.currency_exchange),
                      label: const Padding(
                        padding: EdgeInsets.all(14),
                        child: Text(
                          'Convert Currency',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    if (errorMessage != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    if (convertedAmount != null) ...[
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Converted Amount',
                              style: TextStyle(
                                color: Color(0xFF1D4ED8),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${convertedAmount!.toStringAsFixed(2)} '
                              '$toCurrency',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF172554),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${amountController.text} $fromCurrency '
                              '= ${convertedAmount!.toStringAsFixed(2)} '
                              '$toCurrency',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    const Text(
                      'Note: Exchange rates are illustrative, '
                      'not live market rates.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
