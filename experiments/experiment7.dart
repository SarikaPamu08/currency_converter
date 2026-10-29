
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const CurrencyFormScreen(),
    );
  }
}

class CurrencyFormScreen extends StatefulWidget {
  const CurrencyFormScreen({super.key});

  @override
  State<CurrencyFormScreen> createState() =>
      _CurrencyFormScreenState();
}

class _CurrencyFormScreenState extends State<CurrencyFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();

  String _selectedCurrency = 'INR';
  String _message = '';

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _convertCurrency() {
    if (_formKey.currentState!.validate()) {
      final amount = double.parse(_amountController.text);
      final rate = _selectedCurrency == 'INR' ? 83.0 : 150.0;
      final convertedAmount = amount * rate;

      setState(() {
        _message =
            'Converted amount: ${convertedAmount.toStringAsFixed(2)} $_selectedCurrency';
      });
    } else {
      setState(() {
        _message = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Amount in USD',
                  hintText: 'Enter amount',
                  prefixIcon: Icon(Icons.attach_money),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an amount';
                  }

                  final amount = double.tryParse(value.trim());

                  if (amount == null) {
                    return 'Please enter a valid number';
                  }

                  if (amount <= 0) {
                    return 'Amount must be greater than zero';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCurrency,
                decoration: const InputDecoration(
                  labelText: 'Target Currency',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'INR',
                    child: Text('Indian Rupee (INR)'),
                  ),
                  DropdownMenuItem(
                    value: 'JPY',
                    child: Text('Japanese Yen (JPY)'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedCurrency = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _convertCurrency,
                child: const Text('Convert'),
              ),
              const SizedBox(height: 20),
              Text(
                _message,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
