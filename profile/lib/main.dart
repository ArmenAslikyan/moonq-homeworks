import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      home: const MyProfilePage(),
    );
  }
}
class MyProfilePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Իմ էջը',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800
          )
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Բարև Ձեզ ես Արմեն Ասլիկյանն։'
        ),
      ),
    );
  }
}