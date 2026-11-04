import 'package:flutter/material.dart';
import 'package:lessons/provider/counter_provider.dart';
import 'package:lessons/ui/second_screen.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              '${counter.count}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: 'Decrease count',
                onPressed: context.read<CounterProvider>().decrement,
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(width: 24),
              IconButton(
                tooltip: 'Increase count',
                onPressed: context.read<CounterProvider>().increment,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const SecondScreen()));
            },
            child: const Text('Route'),
          ),
        ],
      ),
    );
  }
}
