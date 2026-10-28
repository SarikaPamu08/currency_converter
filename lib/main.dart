
import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyApp());
}

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3155D9),
        ),
        useMaterial3: true,
      ),
      home: const ConverterPage(),
    );
  }
}

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final amountController = TextEditingController(text: '100');

  final Map<String, double> rates = {
    'USD': 1.0,
    'INR': 83.50,
    'EUR': 0.92,
    'GBP': 0.79,
    'JPY': 150.0,
  };

  String from = 'USD';
  String to = 'INR';
  double? result;
  String? error;

  void convert() {
    final amount = double.tryParse(amountController.text.trim());

    setState(() {
      if (amount == null || amount < 0) {
        result = null;
        error = 'Enter a valid non-negative amount.';
      } else {
        result = amount / rates[from]! * rates[to]!;
        error = null;
      }
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
      backgroundColor: const Color(0xFFF2F5FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF172554),
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.currency_exchange),
            SizedBox(width: 10),
            Text('Currency Converter'),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.public,
                      size: 55,
                      color: Color(0xFF3155D9),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Convert your money',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text('Amount'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: amountController,
                      keyboardType:
                          const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.payments_outlined),
                        border: OutlineInputBorder(),
                        hintText: 'Enter amount',
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text('From Currency'),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: from,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: rates.keys.map((currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => from = value);
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.center,
                      child: IconButton.filled(
                        tooltip: 'Swap currencies',
                        onPressed: () {
                          setState(() {
                            final previous = from;
                            from = to;
                            to = previous;
                            result = null;
                          });
                        },
                        icon: const Icon(Icons.swap_vert),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text('To Currency'),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: to,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: rates.keys.map((currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => to = value);
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: convert,
                      icon: const Icon(Icons.currency_exchange),
                      label: const Padding(
                        padding: EdgeInsets.all(14),
                        child: Text('Convert Currency'),
                      ),
                    ),
                    if (error != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                    if (result != null) ...[
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8EEFF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          children: [
                            const Text('Converted Amount'),
                            const SizedBox(height: 8),
                            Text(
                              '${result!.toStringAsFixed(2)} $to',
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF172554),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 18),
                    const Text(
                      'Note: Exchange rates are illustrative, not live.',
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
