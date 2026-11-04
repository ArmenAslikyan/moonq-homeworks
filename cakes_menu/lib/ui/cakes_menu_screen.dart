import 'package:cakes_menu/ui/widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:cakes_menu/ui/widgets/cart_page.dart';
import 'package:cakes_menu/ui/widgets/home_page.dart';
import 'package:cakes_menu/ui/widgets/orders_page.dart';
import 'package:cakes_menu/ui/widgets/profile_page.dart';

class CakesMenuScreen extends StatefulWidget {
  const CakesMenuScreen({super.key});

  @override
  State<CakesMenuScreen> createState() => _CakesMenuScreenState();
}

class _CakesMenuScreenState extends State<CakesMenuScreen> {
  int count = 0;
  final pages = const [
    HomePage(),
    Categories(),
    OrdersPage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbe9e5),
      appBar: AppBar(
        backgroundColor: const Color(0xfffbe9e5),
        title: Text(
          count == 4 ? 'Պրոֆիլ' : 'Քաղցր անկյուն',
          style: const TextStyle(
            color: Color(0xff1f0b0a),
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: count == 4
            ? null
            : [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      count = 4;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffeac3c4),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.person, size: 35, color: Color(0xff421822)),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
      ),
      body: pages[count],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        currentIndex: count,
        selectedItemColor: Color(0xffb54b59),
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w800
        ),        
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            count = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Գլխավոր'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Կատեգորիաներ'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Պատվերներ'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Զամբյուղ'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Պրոֆիլ'
          ),
        ],
      ),
    );
  }
}