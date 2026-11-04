// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/ui/weather_app_screen.dart';

class WeatherAppStartScreen extends StatelessWidget {
  const WeatherAppStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff222a46),
            Color(0xff483d8f),
            Color(0xff684aa8),
            Color(0xff933fa7)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Center(
                child: Image.asset(
                  'assets/cloud_image.png',
                  height: 380,
                  width: 380
                ),
              ),
              SizedBox(height: 60),
              Text(
                'Weather',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                  fontWeight: FontWeight.w700
                )
              ),
              Text(
                'Forecasts',
                style: TextStyle(
                  color: Color(0xffDDB130),
                  fontSize: 64,
                  fontWeight: FontWeight.w500
                )
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WeatherAppScreen()
                    )
                  );
                },
                child: Center(
                  child: Container(
                    width: 220,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xffDDB130),
                      borderRadius: BorderRadius.circular(44),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'See weather',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff392e83),
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}