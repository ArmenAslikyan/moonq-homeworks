/// Weather data model.
/// Holds all the information we get from the OpenWeatherMap API.
class Weather {
  final String cityName;
  final String country;
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final double clouds;
  final String main;
  final String description;
  final DateTime? sunrise;
  final DateTime? sunset;

  Weather({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    required this.clouds,
    required this.main,
    required this.description,
    this.sunrise,
    this.sunset,
  });

  /// Creates a Weather object from the JSON map returned by the API.
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] ?? '',
      country: json['sys']?['country'] ?? '',
      temperature: (json['main']?['temp'] as num?)?.toDouble() ?? 0,
      feelsLike: (json['main']?['feels_like'] as num?)?.toDouble() ?? 0,
      tempMin: (json['main']?['temp_min'] as num?)?.toDouble() ?? 0,
      tempMax: (json['main']?['temp_max'] as num?)?.toDouble() ?? 0,
      pressure: (json['main']?['pressure'] as num?)?.toInt() ?? 0,
      humidity: (json['main']?['humidity'] as num?)?.toInt() ?? 0,
      visibility: (json['visibility'] as num?)?.toInt() ?? 0,
      windSpeed: (json['wind']?['speed'] as num?)?.toDouble() ?? 0,
      windDeg: (json['wind']?['deg'] as num?)?.toInt() ?? 0,
      windGust: (json['wind']?['gust'] as num?)?.toDouble(),
      clouds: (json['clouds']?['all'] as num?)?.toDouble() ?? 0,
      main: (json['weather']?[0]?['main'] as String?) ?? '',
      description: (json['weather']?[0]?['description'] as String?) ?? '',
      sunrise: json['sys']?['sunrise'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (json['sys']['sunrise'] as int) * 1000)
          : null,
      sunset: json['sys']?['sunset'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (json['sys']['sunset'] as int) * 1000)
          : null,
    );
  }

  /// Converts wind degrees (0-360) to a compass direction like "N", "NE", etc.
  String get windDirection {
    const directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    final index = ((windDeg + 22.5) % 360 / 45).floor();
    return directions[index];
  }

  /// Visibility converted from meters to kilometers.
  String get visibilityKm => (visibility / 1000).toStringAsFixed(1);

  /// Sunrise time formatted as "HH:MM".
  String get sunriseTime =>
      sunrise != null
          ? '${sunrise!.hour.toString().padLeft(2, '0')}:${sunrise!.minute.toString().padLeft(2, '0')}'
          : '--:--';

  /// Sunset time formatted as "HH:MM".
  String get sunsetTime =>
      sunset != null
          ? '${sunset!.hour.toString().padLeft(2, '0')}:${sunset!.minute.toString().padLeft(2, '0')}'
          : '--:--';
}

