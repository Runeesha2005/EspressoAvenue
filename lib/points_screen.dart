import 'package:first_flutter_app/delivery.dart';
import 'package:first_flutter_app/menulist.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'notifications_screen.dart';
//import 'menu_screen.dart';
import 'account_screen.dart';

class PointsScreen extends StatefulWidget {
  @override
  _PointsScreenState createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  String _connectionStatus = 'Unknown';
  late Connectivity _connectivity;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _initializeConnectivity();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _connectionStatus = result.toString();
      });
    });
  }

  Future<void> _initializeConnectivity() async {
    final ConnectivityResult result = await _connectivity.checkConnectivity();
    setState(() {
      _connectionStatus = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Loyalty Points',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make it bolder
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PointsEntryCard(
              purchaseDescription: 'Coffee Purchase - Double Points Weekend',
              pointsEarned: 10,
              connectionStatus: _connectionStatus,
            ),
            PointsEntryCard(
              purchaseDescription: 'Lunch Combo - Triple Points Tuesday',
              pointsEarned: 15,
              connectionStatus: _connectionStatus,
            ),
            PointsEntryCard(
              purchaseDescription: 'Afternoon Snack - Happy Hour Special',
              pointsEarned: 5,
              connectionStatus: _connectionStatus,
            ),
            PointsEntryCard(
              purchaseDescription: 'Dinner Date - Weekend Special',
              pointsEarned: 20,
              connectionStatus: _connectionStatus,
            ),
            PointsEntryCard(
              purchaseDescription: 'Late-night Coffee - Midnight Brew',
              pointsEarned: 8,
              connectionStatus: _connectionStatus,
            ),
            PointsEntryCard(
              purchaseDescription: 'Weekend Brunch - Family Gathering',
              pointsEarned: 12,
              connectionStatus: _connectionStatus,
            ),
          ],
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
                // Navigate to the home screen or perform home-related action
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeScreen()),
                // );
              },
            ),
            IconButton(
              icon: Icon(Icons.menu_book, color: Colors.white),
              onPressed: () {
                // Navigate to the menu screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuList()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delivery_dining, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveryScreen()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PointsEntryCard extends StatelessWidget {
  final String purchaseDescription;
  final int pointsEarned;
  final String connectionStatus;

  PointsEntryCard({
    required this.purchaseDescription,
    required this.pointsEarned,
    required this.connectionStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.brown[50],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Purchase: $purchaseDescription',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Points Earned: $pointsEarned',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.brown[300],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Connection Status: $connectionStatus',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
