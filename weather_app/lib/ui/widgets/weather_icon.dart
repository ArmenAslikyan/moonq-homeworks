/// Returns the right weather icon based on the weather condition.

import 'package:flutter/material.dart';

/// Takes the weather condition string (like "Clear", "Rain", etc.)
/// and returns a matching colored Icon widget.
Icon getWeatherIcon(String weatherMain, {double size = 80}) {
  switch (weatherMain.toLowerCase()) {
    case 'clear':
      return Icon(Icons.wb_sunny, size: size, color: Colors.amber);
    case 'clouds':
      return Icon(Icons.cloud, size: size, color: Colors.white70);
    case 'rain':
    case 'drizzle':
      return Icon(Icons.beach_access, size: size, color: Colors.lightBlueAccent);
    case 'thunderstorm':
      return Icon(Icons.flash_on, size: size, color: Colors.yellowAccent);
    case 'snow':
      return Icon(Icons.ac_unit, size: size, color: Colors.white);
    case 'mist':
    case 'fog':
    case 'haze':
      return Icon(Icons.foggy, size: size, color: Colors.white54);
    default:
      return Icon(Icons.wb_cloudy, size: size, color: Colors.white70);
  }
}

