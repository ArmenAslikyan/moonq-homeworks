import 'package:flutter/material.dart';

class SizeButton extends StatefulWidget {
  const SizeButton({super.key,
  required this.size,
  required this.chosen,
  required this.onTap});

  final String size;
  final bool chosen;
  final VoidCallback onTap;

  @override
  State<SizeButton> createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  @override
  Widget build(BuildContext context) {
    final Color bg = widget.chosen ? const Color(0xff6b4d45) : Colors.white;
    final Color color = widget.chosen ? Colors.white : Colors.black;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
        ),
        child: Center(child: 
        Text(
          widget.size,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w900,
            fontSize: 20
          )
        
            )
          )
        )
    );
  }
}
