import 'package:flutter/material.dart';

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Align(
            child: Column(
              children: [
                SizedBox(height: 20,),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: Container(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.person, color: Colors.amber, size: 90,),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}