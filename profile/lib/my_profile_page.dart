
import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Իմ էջը',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800
          )
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Բարև Ձեզ ես Արմեն Ասլիկյանն։'
        ),
      ),
    );
  }
}