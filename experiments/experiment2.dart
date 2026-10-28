
import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetExperimentApp());
}

class WidgetExperimentApp extends StatelessWidget {
  const WidgetExperimentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets Experiment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const WidgetExperimentPage(),
    );
  }
}

class WidgetExperimentPage extends StatelessWidget {
  const WidgetExperimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Experiment 2: Exploring Widgets',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Text widget
            const Text(
              '1. Text Widget',
              style: TextStyle(fontSize: 18, color: Colors.indigo),
            ),
            const Text('This is a sample text in Flutter.'),

            const Divider(height: 30),

            // Container widget
            const Text(
              '2. Container Widget',
              style: TextStyle(fontSize: 18, color: Colors.indigo),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('A styled container with padding and color.'),
            ),

            const SizedBox(height: 20),

            // Image widget using a built-in icon as a reliable visual
            const Text(
              '3. Image / Icon Widget',
              style: TextStyle(fontSize: 18, color: Colors.indigo),
            ),
            const Icon(
              Icons.currency_exchange,
              size: 70,
              color: Colors.indigo,
            ),

            const Divider(height: 30),

            // Row and Column widgets
            const Text(
              '4. Row and Column Widgets',
              style: TextStyle(fontSize: 18, color: Colors.indigo),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.attach_money, size: 40, color: Colors.green),
                Icon(Icons.currency_rupee, size: 40, color: Colors.orange),
                Icon(Icons.euro, size: 40, color: Colors.blue),
              ],
            ),

            const SizedBox(height: 20),

            // Button widget
            const Text(
              '5. Button Widget',
              style: TextStyle(fontSize: 18, color: Colors.indigo),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button clicked successfully!'),
                  ),
                );
              },
              child: const Text('Click Me'),
            ),

            const SizedBox(height: 20),

            // Card widget
            const Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.indigo,
                ),
                title: Text('Currency Card'),
                subtitle: Text('Example of a Card and ListTile widget'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
