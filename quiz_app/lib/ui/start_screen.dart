import 'package:flutter/material.dart';
import 'package:quiz_app/ui/quiz_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40
              ),
              Text('Հարցաշար', 
                style: TextStyle(
                  fontSize: 46,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 16),
              Text('Ընդհանուր գիտելիքների թեստ՝ գիտություն, պատմություն, աշխարհագրություն, տեխնոլոգիա և տրամաբանություն։',
                style: TextStyle(
                  fontSize: 20
                )
              ),
              Spacer(),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuizScreen()
                      )
                    );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Text('Start',
                      style: TextStyle(color: Colors.white, fontSize: 20)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}