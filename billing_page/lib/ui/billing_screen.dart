import 'package:billing_page/ui/widgets/expanse_widget.dart';
import 'package:billing_page/ui/widgets/money_methods.dart';
import 'package:flutter/material.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Align(
            alignment: Alignment.center,
            child: ClipOval(
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFuZcN4PkuIdPC_fIjBoRDAspRvzN5kxc_ywIscQ_2qvNG4opqY-MEKJJI&s=10',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          'Բարև, Անահիտ!',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Icon(Icons.notifications_outlined, size: 30),
          SizedBox(width: 20)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Ընդհանուր տեսք',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28
              )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff2a5180),
                  borderRadius: BorderRadius.circular(18)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Ընդհանուր հաշվեկշիռ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text('250,000֏',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w800
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text('AMD 250,000 ֏',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 224, 223, 223),
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: [
                Expanded(
                  child: MoneyMethods(
                    icon: Icons.add,
                    text: 'Ավելացնել\nԾախս',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: MoneyMethods(
                    icon: Icons.swap_horiz,
                    text: 'Փոխանցել',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: MoneyMethods(
                    icon: Icons.description,
                    text: 'Վճարել\nկոմունալ',
                  ),
                ),
              ],),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffdbeaf7),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Գալիք Վճարումներ', style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20
                            )),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        ExpanseWidget(
                          text: 'Ինտերնետ', 
                          date: '29 Օգոստոս, 2026', 
                          icon_bg: const Color.fromARGB(255, 194, 236, 255), 
                          icon_color: Colors.blue,
                          icon: Icons.wifi,
                        ),
                        ExpanseWidget(
                          text: 'Մունք վարձ', 
                          date: '30 Օգոստոս, 2026', 
                          icon_bg: Colors.orangeAccent, 
                          icon_color: const Color.fromARGB(255, 174, 105, 2),
                          icon: Icons.money,
                        ),
                        ExpanseWidget(
                          text: 'Դասաստուի ծաղիկի փող', 
                          date: '1 Սեպտեմբեր, 2026', 
                          icon_bg: const Color.fromARGB(255, 194, 236, 255), 
                          icon_color: Colors.blue,
                          icon: Icons.local_florist,
                        ),
                        ExpanseWidget(
                          text: 'Էլեկտրաէներգիա', 
                          date: '3 Սեպտեմբեր, 2026', 
                          icon_bg: Colors.orangeAccent, 
                          icon_color: const Color.fromARGB(255, 174, 105, 2),
                          icon: Icons.bolt,
                        ),
                        ExpanseWidget(
                          text: 'Ջուր', 
                          date: '5 Սեպտեմբեր, 2026', 
                          icon_bg: const Color.fromARGB(255, 194, 236, 255), 
                          icon_color: Colors.blue,
                          icon: Icons.water_drop,
                        ),
                        ExpanseWidget(
                          text: 'Գազ', 
                          date: '7 Սեպտեմբեր, 2026', 
                          icon_bg: Colors.orangeAccent, 
                          icon_color: const Color.fromARGB(255, 174, 105, 2),
                          icon: Icons.local_fire_department,
                        ),
                        ExpanseWidget(
                          text: 'Հեռախոս', 
                          date: '10 Սեպտեմբեր, 2026', 
                          icon_bg: const Color.fromARGB(255, 194, 236, 255), 
                          icon_color: Colors.blue,
                          icon: Icons.phone,
                        ),
                      ],
                    )
                                      ], 
                )
              )
            )
          ],
        )
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(
            color: Color(0xff264e4b)
          ))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.home, color: Color(0xff264e4b), size: 28),
                    SizedBox(height: 4),
                    Text('Գլխավոր', style: TextStyle(color: Color(0xff264e4b), fontSize: 12)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.wallet, color: Color(0xff264e4b), size: 28),
                    SizedBox(height: 4),
                    Text('Գործընթացներ', style: TextStyle(color: Color(0xff264e4b), fontSize: 9)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add_circle_outline, color: Color(0xff264e4b), size: 28),
                    SizedBox(height: 4),
                    Text('Ավելացնել', style: TextStyle(color: Color(0xff264e4b), fontSize: 12)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.gps_fixed, color: Color(0xff264e4b), size: 28),
                    SizedBox(height: 4),
                    Text('Նպատակներ', style: TextStyle(color: Color(0xff264e4b), fontSize: 11)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.person, color: Color(0xff264e4b), size: 28),
                    SizedBox(height: 4),
                    Text('Պրոֆիլ', style: TextStyle(color: Color(0xff264e4b), fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
