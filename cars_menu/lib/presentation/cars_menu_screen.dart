import 'package:cars_menu/presentation/widgets/cars_menu_start_page.dart';
import 'package:flutter/material.dart';

class CarsMenuScreen extends StatefulWidget {
  const CarsMenuScreen({super.key});

  @override
  State<CarsMenuScreen> createState() => _CarsMenuScreenState();
}

class _CarsMenuScreenState extends State<CarsMenuScreen> {
  List<Widget> screens = [
    CarsMenuStartPage()
  ];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f242a),
      appBar: AppBar(
        backgroundColor: Color(0xff1f242a),
        title: Text(
          'Մեքենաների Կենտրոն',
          style: TextStyle(
            color: Color(0xffd1d4db),
            fontSize: 26,
            fontWeight: FontWeight.w800
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff334048),
              borderRadius: BorderRadius.circular(30)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                color: Color(0xffd1d4db),
                size: 35,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: screens[count]
    );
  }
}
