import 'package:capuchino/ui/widgets/size_button.dart';
import 'package:flutter/material.dart';

class SizeChoose extends StatefulWidget {
  const SizeChoose({super.key});

  @override
  State<SizeChoose> createState() => _SizeChooseState();
}

class _SizeChooseState extends State<SizeChoose> {
  final Map<String, double> sizePrice = {
    'S' : 3.50,
    'M' : 4.50,
    'L' : 5.50
  };
  String size = 'M';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '\$${sizePrice[size]!}',
                style: TextStyle(
                  color: Color(0xff6b4d45),
                  fontSize: 40,
                  fontWeight: FontWeight.w800
                )
                ),
                SizedBox(width: 20),
                Text(
                '\$${sizePrice[size]! + 1}',
                style: TextStyle(
                  color: Color.fromARGB(255, 169, 169, 169),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough
                )
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Size',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 27
              )
            ),
          ),
          Row(
            children: [
              SizeButton(
                size: 'S',
                chosen: size == 'S',
                onTap: () {
                  setState(() {
                    size = 'S';
                  });
                },
              ),
              SizedBox(width: 10),
              SizeButton(
                size: 'M',
                chosen: size == 'M',
                onTap: () {
                  setState(() {
                    size = 'M';
                  });
                },
              ),
              SizedBox(width: 10),
              SizeButton(
                size: 'L',
                chosen: size == 'L',
                onTap: () {
                  setState(() {
                    size = 'L';
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
