/// The main weather content widget.
/// It fetches the weather data and builds the full layout
/// by combining WeatherIcon, DetailCard, and DetailRow widgets.

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/ui/widgets/weather_icon.dart';
import 'package:weather_app/ui/widgets/detail_card.dart';
import 'package:weather_app/ui/widgets/detail_row.dart';

class WeatherContent extends StatefulWidget {
  const WeatherContent({super.key});

  @override
  State<WeatherContent> createState() => _WeatherContentState();
}

class _WeatherContentState extends State<WeatherContent> {
  /// We store the future here so it only runs once (not on every rebuild).
  late final Future<Weather> _weatherFuture;

  @override
  void initState() {
    super.initState();
    _weatherFuture = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: _weatherFuture,
      builder: (context, snapshot) {
        // Still loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.only(top: 200),
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        }

        // Something went wrong
        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Error: ${snapshot.error}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        // We got data — show it!
        if (snapshot.hasData) {
          final weather = snapshot.data!;
          return _buildWeatherLayout(weather);
        }

        // Fallback (should never happen)
        return const Center(
          child: Text(
            'No weather data found',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  /// Builds the full weather layout from a Weather object.
  Widget _buildWeatherLayout(Weather weather) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          // --- Weather icon ---
          getWeatherIcon(weather.main, size: 80),
          const SizedBox(height: 8),

          // --- City name ---
          Text(
            '${weather.cityName}, ${weather.country}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),

          // --- Temperature ---
          Text(
            '${weather.temperature.toStringAsFixed(1)}°C',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.w200,
            ),
          ),

          // --- Description ---
          Text(
            weather.description[0].toUpperCase() +
                weather.description.substring(1),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),

          // --- High / Low ---
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'H: ${weather.tempMax.toStringAsFixed(1)}°',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(width: 16),
              Text(
                'L: ${weather.tempMin.toStringAsFixed(1)}°',
                style: const TextStyle(color: Colors.white60, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // --- Card 1: Temperature details ---
          DetailCard(
            children: [
              DetailRow(
                icon: Icons.thermostat,
                label: 'Feels Like',
                value: '${weather.feelsLike.toStringAsFixed(1)}°C',
              ),
              DetailRow(
                icon: Icons.water_drop,
                label: 'Humidity',
                value: '${weather.humidity}%',
              ),
              DetailRow(
                icon: Icons.compress,
                label: 'Pressure',
                value: '${weather.pressure} hPa',
              ),
            ],
          ),
          const SizedBox(height: 12),

          // --- Card 2: Wind & visibility ---
          DetailCard(
            children: [
              DetailRow(
                icon: Icons.air,
                label: 'Wind',
                value:
                    '${weather.windSpeed.toStringAsFixed(1)} m/s ${weather.windDirection}',
              ),
              if (weather.windGust != null)
                DetailRow(
                  icon: Icons.wind_power,
                  label: 'Gusts',
                  value: '${weather.windGust!.toStringAsFixed(1)} m/s',
                ),
              DetailRow(
                icon: Icons.cloud,
                label: 'Cloudiness',
                value: '${weather.clouds.toInt()}%',
              ),
              DetailRow(
                icon: Icons.visibility,
                label: 'Visibility',
                value: '${weather.visibilityKm} km',
              ),
            ],
          ),
          const SizedBox(height: 12),

          // --- Card 3: Sunrise & Sunset ---
          DetailCard(
            children: [
              DetailRow(
                icon: Icons.wb_sunny_outlined,
                label: 'Sunrise',
                value: weather.sunriseTime,
              ),
              DetailRow(
                icon: Icons.nights_stay_outlined,
                label: 'Sunset',
                value: weather.sunsetTime,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

