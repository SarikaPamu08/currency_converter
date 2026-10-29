
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
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const ResponsiveConverterScreen(),
    );
  }
}

class ResponsiveConverterScreen extends StatelessWidget {
  const ResponsiveConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 600;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 900,
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Flex(
                  direction: isWide
                      ? Axis.horizontal
                      : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.currency_exchange,
                      size: 80,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: isWide ? 32 : 0,
                      height: isWide ? 0 : 24,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Convert Your Currency',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Convert currencies with a '
                            'simple, responsive interface.',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          const TextField(
                            keyboardType:
                                TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Enter amount',
                              prefixText: '₹ ',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'From: INR',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Icon(Icons.swap_horiz),
                              Expanded(
                                child: Text(
                                  'To: USD',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Convert'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
