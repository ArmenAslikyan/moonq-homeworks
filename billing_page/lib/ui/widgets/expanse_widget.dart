import 'package:flutter/material.dart';

class ExpanseWidget extends StatelessWidget {
  const ExpanseWidget({
    super.key,
    required this.text,
    required this.date,
    required this.icon_bg,
    required this.icon_color,
    required this.icon,
  });

  final String text;
  final String date;
  final Color icon_bg;
  final Color icon_color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(
          color: Colors.grey,
          width: 0.5
        )),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: icon_bg,
                    ),
                    child: Icon(icon, color: icon_color),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}