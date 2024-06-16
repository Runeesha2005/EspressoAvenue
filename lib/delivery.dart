import 'package:first_flutter_app/menulist.dart';
import 'package:first_flutter_app/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'weather_service.dart';
import 'weather_model.dart';
import 'notifications_screen.dart'; // Import the NotificationsScreen to use for bottom navigation

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = false;
  String _error = '';
  bool _canDeliver = true;

  final TextEditingController _controller = TextEditingController();

  Future<void> _fetchWeather() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final weatherData = await _weatherService.fetchWeather(_controller.text);
      setState(() {
        _weather = Weather.fromJson(weatherData);
        _canDeliver = canDeliver(weatherData);
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  bool canDeliver(Map<String, dynamic> weatherData) {
    String weatherCondition = weatherData['weather'][0]['main'].toLowerCase();
    double windSpeed = (weatherData['wind']['speed'] as num).toDouble();
    double precipitation = (weatherData['main']['humidity'] as num).toDouble();

    if (weatherCondition.contains('storm') ||
        weatherCondition.contains('snow') ||
        (weatherCondition.contains('rain') && precipitation > 70) ||
        windSpeed > 15) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Delivery Status',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Make it bolder
            ),), // Updated app bar title
          //centerTitle: true, // Centered title
          backgroundColor: Colors.brown,
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/coffee1.png', height: 300), // Updated coffee delivery image
                SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Enter city name',
                    labelStyle: TextStyle(color: Colors.brown[700]),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search, color: Colors.brown[700]),
                      onPressed: _fetchWeather,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown[700]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown[900]!),
                    ),
                  ),
                  style: TextStyle(color: Colors.brown[900]),
                ),
                SizedBox(height: 20),
                _isLoading
                    ? CircularProgressIndicator()
                    : _error.isNotEmpty
                    ? Text(_error, style: TextStyle(color: Colors.red))
                    : _weather != null
                    ? Column(
                  children: [
                    Text(
                      'Description: ${_weather!.description}',
                      style: TextStyle(fontSize: 18, color: Colors.brown[800]),
                    ),
                    Text(
                      'Temperature: ${_weather!.temperature} °C',
                      style: TextStyle(fontSize: 18, color: Colors.brown[800]),
                    ),
                    Text(
                      'Feels like: ${_weather!.feelsLike} °C',
                      style: TextStyle(fontSize: 18, color: Colors.brown[800]),
                    ),
                    Text(
                      'Humidity: ${_weather!.humidity}%',
                      style: TextStyle(fontSize: 18, color: Colors.brown[800]),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _canDeliver ? 'We can deliver to your location!' : 'Sorry, we cannot deliver due to weather conditions.',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _canDeliver ? Colors.green : Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
                    : Container(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.brown,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
          IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {
            // Navigate to home or perform home-related action
          },
        ),

        IconButton(
          icon: Icon(Icons.menu_book, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuList()), // Navigate to NotificationsScreen
            );
          },
        ),


        IconButton(
        icon: Icon(Icons.delivery_dining, color: Colors.white),
    onPressed: () {
    //Navigate to delivery Screen
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    // Navigate to the notifications screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotificationsScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.account_circle, color: Colors.white),
                  onPressed: () {
                    // Navigate to the account screen
                  },
                ),

              ],
            ),
          ),
        );
      }
    }

