import 'package:flutter/material.dart';
import 'package:lessons/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Second page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          Text('${counter.count}', style: TextStyle(fontSize: 250, fontWeight: FontWeight.w900),)
        ],
      ),
    );
  }
}
