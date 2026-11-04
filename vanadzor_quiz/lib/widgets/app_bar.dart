import 'package:flutter/material.dart';

class VanadzorQuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  const VanadzorQuizAppBar({super.key, this.showBackButton = false});

  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff121a15),
      title: const Text(
        'Վանաձոր Quiz',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 35,
          color: Color(0xff74ff9d),
        ),
      ),
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              tooltip: 'Go back',
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back, color: Color(0xff74ff9d)),
            )
          : Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
            ),
      toolbarHeight: 100,
      leadingWidth: showBackButton ? 56 : 100,
      shape: const Border(
        bottom: BorderSide(
          color: Color.fromARGB(255, 66, 97, 81),
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}