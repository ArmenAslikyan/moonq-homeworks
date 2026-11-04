import 'package:flutter/material.dart';
import 'package:profile_card/presentation/profile_card_screen.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      debugShowCheckedModeBanner: false,
      home: ProfileCardScreen(),
    );
  }
}