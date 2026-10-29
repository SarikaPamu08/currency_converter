
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CurrencyProvider(),
      child: const CurrencyConverterApp(),
    ),
  );
}

// Provider manages the currency conversion state.
class CurrencyProvider extends ChangeNotifier {
  double amount = 100;
  double rate = 0.012;
  double result = 0;

  void updateAmount(String value) {
    final parsedAmount = double.tryParse(value);

    if (parsedAmount != null && parsedAmount >= 0) {
      amount = parsedAmount;
      notifyListeners();
    }
  }

  void convert() {
    result = amount * rate;
    notifyListeners();
  }
}

// StatelessWidget displays the application.
class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      home: const StateManagementScreen(),
    );
  }
}

// StatefulWidget manages local UI state.
class StateManagementScreen extends StatefulWidget {
  const StateManagementScreen({super.key});

  @override
  State<StateManagementScreen> createState() =>
      _StateManagementScreenState();
}

class _StateManagementScreenState
    extends State<StateManagementScreen> {
  final TextEditingController amountController =
      TextEditingController(text: '100');

  bool showDetails = false;

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currency = context.watch<CurrencyProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Enter amount in USD',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              onChanged: currency.updateAmount,
            ),
            const SizedBox(height: 20),
            Text(
              'Converted amount: ${currency.result.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CurrencyProvider>().convert();

                setState(() {
                  showDetails = !showDetails;
                });
              },
              child: const Text('Convert Currency'),
            ),
            if (showDetails)
              const Text('Conversion rate: 1 USD = 0.012'),
          ],
        ),
      ),
    );
  }
}
