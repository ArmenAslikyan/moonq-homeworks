import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text('$_counter', style: TextStyle(fontSize: 75),)
      ),
      floatingActionButton: TextButton(
        child: Text('Press me!'),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}