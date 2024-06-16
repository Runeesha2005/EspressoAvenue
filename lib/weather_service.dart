import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _apiKey = '54921aac3b1f4b03f5993794c2742faf'; // Replace with your OpenWeather API key
  static const String _baseUrl = 'http://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    final url = '$_baseUrl?q=$cityName&appid=$_apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

