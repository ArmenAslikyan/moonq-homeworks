import 'package:flutter/material.dart';
import 'package:food_app/ui/widgets/app_card.dart';
import 'package:food_app/ui/widgets/components.dart';
import 'package:food_app/ui/widgets/count_section.dart';
import 'package:food_app/ui/widgets/number_text.dart';

class FoodAppScreen extends StatefulWidget {
  const FoodAppScreen({super.key});

  @override
  State<FoodAppScreen> createState() => _FoodAppScreenState();
}

class _FoodAppScreenState extends State<FoodAppScreen> {
  bool hasView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F7F6),
      appBar: AppBar(
        title: Components.text(
          'Բաղադրատոմսեր',
          fontSize: 23,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWAluKIg9ncFMeSoPazu89MY5630271FTEl_46rT740DX--w4wm73Yt40&s=10',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Components.text(
              'Շոկոլադե Թխվածքաբլիթ',
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Expanded(
                    child: AppCard(
                      icon: Icons.access_time,
                      data: '20 րոպե',
                      color: Color(0xFFCBEBF0),
                      iconColor: Color(0xFF1F6D7A),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: AppCard(
                      icon: Icons.local_fire_department,
                      data: '320 կկալ',
                      color: Color(0xFFFCE0AC),
                      iconColor: Color(0xFFB26A00),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: AppCard(
                      icon: Icons.restaurant,
                      data: '12 հատ',
                      color: Color(0xFFD0EED3),
                      iconColor: Color(0xFF2E7D32),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Components.text(
                        'Բաղադրիչներ:',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Components.text('1. Ալյուր(200գ)', fontSize: 16),
                    Components.text('2. Կարագ(100գ)', fontSize: 16),
                    Components.text('3. Շաքարավազ(100գ)', fontSize: 16),
                    Components.text('4. Փխրեցուցիչ', fontSize: 16),
                    Components.text('5. Շոկոլադի կտորներ', fontSize: 16),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Պատրաստման եղանակը:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const NumberText(
                      number: '1',
                      text: 'Խառնեք Չոր բաղադրիչները․',
                    ),
                    const SizedBox(height: 8),
                    const NumberText(
                      number: '2',
                      text: 'Հարել Կարագն ու շաքարավազը․',
                    ),
                    const SizedBox(height: 8),
                    const NumberText(
                      number: '3',
                      text: 'Միավորել Զանգվածները․',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (hasView) const CountSection(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Material(
                color: const Color(0xFF4CAF50),
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  splashColor: const Color.fromARGB(255, 7, 255, 61),
                  onTap: () {
                   print('l');
                   setState(() {
                     hasView = !hasView;
                   });
                  },
                  onLongPress: (){
                    print('Long Hello');
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: Center(
                      child: Text(
                        'Ավելացնել Զամբյուղում',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
