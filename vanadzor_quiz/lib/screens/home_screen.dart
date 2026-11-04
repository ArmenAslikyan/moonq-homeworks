import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanadzor_quiz/provider/profile_details.dart';
import 'package:vanadzor_quiz/screens/participant_screen.dart';
import 'package:vanadzor_quiz/widgets/feature_badge.dart';
import 'package:vanadzor_quiz/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121a16),
      appBar: const VanadzorQuizAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff1b2921),
                  borderRadius: BorderRadius.circular(20),
                  border: BoxBorder.all(
                    color: Color.fromARGB(255, 66, 97, 81),
                    width: 1
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Վանաձոր Quiz',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'Տոնենք Վանաձորի օրը - Ստուգիր գիտելիքներդ մեր սիրելի քաղաքի մասին',
                        style: TextStyle(
                          color: Color(0xffa1b6ab),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/landscape.webp',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black54, Colors.transparent],
                            stops: [0.8, 1]
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: FeatureBadge(
                                  icon: Icons.casino_outlined,
                                  title: '10 պատահական հարց',
                                  subtitle: 'ընտրված 20-ից',
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: FeatureBadge(
                                  icon: Icons.timer_outlined,
                                  title: 'Արագ պատասխաններ',
                                  subtitle: '4 տարբերակներից',
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: FeatureBadge(
                                  icon: Icons.emoji_events_outlined,
                                  title: '1 միավոր',
                                  subtitle: 'յուրաքանչյուր ճիշտ պատասխանի համար',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              
                              Text(
                                'Բարի գալուստ Վանաձոր քաղաքի տոնական quiz-համակարգ։ Պատասխանիր 10 պատահական հարցերի Վանաձորի պատմության, մշակույթի և բնության մասին, վաստակիր առավելագույն միավորներ և զբաղեցրու քո տեղը լավագույն մասնակիցների վարկանիշային աղյուսակում։',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13
                                ),
                              ),
                              SizedBox(height: 5)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00C853), Color(0xFF69F0AE)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider(
                          create: (_) => ProfileDetails(),
                          child: const ParticipantScreen(),
                        ),
                      ),
                    );
                                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_circle_filled, color: Color(0xFF003314), size: 24),
                        SizedBox(width: 8),
                        Text(
                          'Սկսել վիկտորինան',
                          style: TextStyle(
                            color: Color(0xFF003314),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Color(0xFF003314), size: 22),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}