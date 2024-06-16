class Weather {
  final String description;
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final String mainDescription;
  final String detailedDescription;
  final String iconCode;
  final double windSpeed;
  final int cloudiness;
  final String cityName;
  final String countryCode;
  final int sunrise;
  final int sunset;


  Weather({
    required this.description,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.mainDescription,
    required this.detailedDescription,
    required this.iconCode,
    required this.windSpeed,
    required this.cloudiness,
    required this.cityName,
    required this.countryCode,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      mainDescription: json['weather'][0]['main'],
      detailedDescription: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
      windSpeed: json['wind']['speed'].toDouble(),
      cloudiness: json['clouds']['all'],
      cityName: json['name'],
      countryCode: json['sys']['country'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
  }
}



