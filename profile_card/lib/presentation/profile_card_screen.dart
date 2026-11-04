import 'package:flutter/material.dart';
import 'package:profile_card/presentation/widgets/profile_info_row.dart';

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 159, 217, 189),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Colors.blue,
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(Icons.person, color: Colors.amber, size: 100),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Արմեն Ասլիկյան',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Flutter սովորող',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const ProfileInfoRow(
                    icon: Icons.email,
                    text: 'Armen.aslikyan12@gmail.com',
                  ),
                  const SizedBox(height: 12),
                  const ProfileInfoRow(
                    icon: Icons.phone,
                    text: '055884323',
                  ),
                  const SizedBox(height: 12),
                  const ProfileInfoRow(
                    icon: Icons.location_on,
                    text: 'Vandzor',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}