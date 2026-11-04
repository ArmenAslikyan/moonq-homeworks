import 'package:flutter/material.dart';

class ChurchAppScreen extends StatefulWidget {
  const ChurchAppScreen({super.key});

  @override
  State<ChurchAppScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ChurchAppScreen> {
  bool showInfo = false;
  String buttonText = 'Տեսնել Ավելին';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Ուղեցույց', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
        centerTitle: true,
        actions: [
          Icon(Icons.search),
          SizedBox(width: 22),
          Icon(Icons.settings),
          SizedBox(width: 22),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10), 
          child: Container(
            color: Colors.grey.withValues(alpha: .6),    // The color of the underline
            height: 1.0,                            // Matches the preferred size height
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                height: 650,
                decoration: BoxDecoration(
                  color: Color(0xffdfe3ec),
                  borderRadius: BorderRadius.circular(18)
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              child: Image.network(
                                'https://i.postimg.cc/KvnRmc8p/Screenshot-from-2026-08-25-22-03-00.png',
                                fit: BoxFit.contain,
                                height: 270
                                ),
                            ),
                            Text(
                                'Հայաստանի Հուշարձանները', 
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                fontWeight: FontWeight.w600, 
                                fontSize: 30,)
                                ),
                            SizedBox(height: 10),
                            Text(
                                'Բացահայտիր պատմական հուշարձանները, մշակութային վայրերը', 
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                fontWeight: FontWeight.w500, 
                                fontSize: 20,)
                                ),
                            SizedBox(height: 25),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showInfo = !showInfo;
                                  if (!showInfo){
                                    buttonText = 'Տեսնել Ավելին';
                                  }else{
                                    buttonText = 'Փակել';
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 45),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(18)
                                ),
                                child: Text(buttonText,
                                  style: TextStyle(color: Colors.white, fontSize: 20)
                                )
                              )
                            ),
                            SizedBox(height: 10),
                            if (showInfo) const Text(
                              'Հայ Առաքելական Եկեղեցին աշխարհի ամենահին քրիստոնեական եկեղեցիներից է։ 301 թվականին Սուրբ Գրիգոր Լուսավորչի և Տրդատ Գ թագավորի ջանքերով Հայաստանն առաջինն աշխարհում քրիստոնեությունը դարձրեց պետական կրոն։ Եկեղեցու հոգևոր և վարչական կենտրոնը Մայր Աթոռ Սուրբ Էջմիածինն է, որտեղ գտնվում է Ամենայն Հայոց Կաթողիկոսի նստավայրը։ Հայկական եկեղեցական ճարտարապետությունն ունի ինքնատիպ ոճ, որն աչքի է ընկնում տուֆ քարով կառուցված ամուր պատերով, կոնաձև գմբեթներով և քանդակազարդ խաչքարերով։ Հայաստանի հայտնի պատմական կենտրոններից են Էջմիածնի Մայր Տաճարը, Գեղարդը, Տաթևը, Հաղպատը և Սանահինը։',
                              style: TextStyle(
                                fontSize: 15,
                                height: 1.6,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                              )                              
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              )
          ],
        )
      ),
      bottomNavigationBar: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.withValues(alpha: .6)))
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                children: [
                  Icon(
                    Icons.explore, 
                    color: const Color(0xff5A5A5A),
                    size: 30),
                  Text('Քարտեզ', style: TextStyle(color: Color(0xff5A5A5A)))
                ],
              ),
              SizedBox(width: 35),
              Column(
                children: [
                  Icon(
                    Icons.travel_explore, 
                    color: const Color(0xff5A5A5A),
                    size: 30),
                  Text('Բացահայտել', style: TextStyle(color: Color(0xff5A5A5A)))
                ],
              ),
              SizedBox(width: 25),
              Column(
                children: [
                  Icon(
                    Icons.turn_right_outlined, 
                    color: const Color(0xff5A5A5A),
                    size: 30),
                  Text('Երթուղի', style: TextStyle(color: Color(0xff5A5A5A)))
                ],
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Icon(
                    Icons.star, 
                    color: const Color(0xff5A5A5A),
                    size: 30),
                  Text('Պահված', style: TextStyle(color: Color(0xff5A5A5A)))
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}