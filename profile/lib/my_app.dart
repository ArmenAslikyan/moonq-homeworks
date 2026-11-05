import 'package:flutter/material.dart';
import 'package:profile/my_profile_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      home: const MyProfilePage(),
    );
  }
}