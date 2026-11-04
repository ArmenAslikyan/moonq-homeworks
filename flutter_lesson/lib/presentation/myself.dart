import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 64, 106),
        foregroundColor: Colors.white,

        titleTextStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 25,
        ),

        title: const Text('Profile'),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            padding: const EdgeInsets.only(right: 30),
            color: Colors.white54,
            
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 27, 64, 106),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a/ACg8ocKsL0Kow37ioCAH4N1P3G2bu9ZxuYtZkTCDvOKk5X4qwjW6oM7a=s192-c-mo'),
                  ),

                  const SizedBox(height: 20),
                  Text('Armen Aslikyan',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white54,
                    fontWeight: FontWeight.bold
                  )),
                  const SizedBox(height: 2),
                  Text('@armen_aslikyan',
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.white54
                  )),
                  const SizedBox(height: 12)
                ],
              ),
              
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 10),
                      Expanded(child: _StatItem(label: 'Posts', value: '67')),
                      Expanded(child: _StatItem(label: 'Likes', value: '1B')),
                      Expanded(child: _StatItem(label: 'Followers', value: '10M')),
                      Expanded(child: _StatItem(label: 'Following', value: '0')),
                      const SizedBox(width: 10)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: _Button(text: 'Edit Profile', color: Color.fromARGB(255, 51, 114, 169))),
                        const SizedBox(width: 20),
                        Expanded(child: _Button(text: 'Share', color: Color.fromARGB(255, 26, 76, 120)))
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 226, 233, 239),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: _Pages(
                        icon: Icons.post_add,
                        title: 'Posts',
                        bg: const Color.fromARGB(255, 51, 114, 169),
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: _Pages(
                        icon: Icons.repeat,
                        title: 'Reposts',
                        bg: const Color.fromARGB(255, 51, 114, 169),
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: _Pages(
                        icon: Icons.bookmark,
                        title: 'Saves',
                        bg: const Color.fromARGB(255, 51, 114, 169),
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: _Pages(
                        icon: Icons.logout,
                        title: 'Log out',
                        bg: Colors.red,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
          
        ),

      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final Color color;
  static const double horPad = 32.0;
  static const double verPad = 16.0;

  const _Button({
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: horPad, vertical: verPad),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color bg;
  final Color textColor;
  static const double horPad = 20;
  static const double verPad = 15;
  static const double defaultBorderRadius = 20.0;

  const _Pages({
    required this.icon,
    required this.title,
    required this.bg,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        padding: const EdgeInsets.symmetric(horizontal: horPad, vertical: verPad),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
      ),
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}