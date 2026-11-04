import 'package:flutter/material.dart';
import 'package:weather_app/ui/weather_app_start_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: WeatherAppStartScreen()
    );
  }
}