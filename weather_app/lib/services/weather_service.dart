/// This file is responsible for fetching weather data from the API.
/// It only does the network call and returns a Weather object.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

/// Calls the OpenWeatherMap API and returns a [Weather] object.
Future<Weather> fetchWeather() async {
  const apiKey = '694163e4426cc73ec0e0a891cffd9fc0';

  final uri = Uri.https(
    'api.openweathermap.org',
    '/data/2.5/weather',
    {
      'q': 'Vanadzor',
      'appid': apiKey,
      'units': 'metric',
    },
  );

  try {
    final response = await http.get(uri).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        return Weather.fromJson(decoded);
      }
      throw const FormatException('Weather API returned an invalid response');
    }

    throw Exception('Failed to load weather data: ${response.statusCode}');
  } catch (e) {
    throw Exception('Could not fetch weather: $e');
  }
}

