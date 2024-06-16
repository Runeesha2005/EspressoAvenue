import 'package:first_flutter_app/caffeine_kick.dart';
import 'package:first_flutter_app/delivery.dart';
import 'package:first_flutter_app/discount_screen.dart';
import 'package:first_flutter_app/healthy_start.dart';
import 'package:first_flutter_app/morning_bliss.dart';
import 'package:first_flutter_app/points_screen.dart';
import 'package:first_flutter_app/savoury.dart';
import 'package:first_flutter_app/sweet_tooth.dart';
import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'notifications_screen.dart';
import 'account_screen.dart';
import 'menulist.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      result = ConnectivityResult.none;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() => _connectionStatus = 'Connected to WiFi');
        break;
      case ConnectivityResult.mobile:
        setState(() => _connectionStatus = 'Connected to Mobile Network');
        break;
      case ConnectivityResult.none:
        setState(() => _connectionStatus = 'No Internet Connection');
        break;
      default:
        setState(() => _connectionStatus = 'Unknown');
        break;
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Espresso Avenue',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.brown,
            padding: EdgeInsets.all(8.0),
            child: Text(
              _connectionStatus,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.0),
                      Text(
                        'Welcome to Espresso Avenue!',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedImage(
                      label: 'Menu List',
                      imagePath: 'assets/menu1.jpg',
                      onTap: () {
                        // Navigate to the MenuList page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MenuList()),
                        );
                      },
                    ),
                    RoundedImage(
                      label: 'Discounts',
                      imagePath: 'assets/shoppingcart.jpg',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DiscountScreen()),
                        );
                      },
                    ),
                    RoundedImage(
                      label: 'Points',
                      imagePath: 'assets/round1.jpg',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PointsScreen()),
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 10.0),
                  child: Text(
                    'The 5 Famous Combos in our Cafe !',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ),
                MobileCard(
                  modelName: 'Esspresso, Croissant, Fresh Orange Juice',
                  brandName: 'Morning Bliss Combo :',
                  price: 9.99,
                  rating: 5, // Rating in stars
                  imagePath: 'assets/morningBliss.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MorningBlissScreen()),
                    );
                  },
                ),
                SizedBox(height: 10.0),
                MobileCard(
                  modelName: 'Green Tea, Avocado Toast, Fresh Fruit Salad',
                  brandName: 'Healthy Start Combo :',
                  price: 7.50,
                  rating: 5, // Rating in stars
                  imagePath: 'assets/healthyStart1.jpeg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HealthyStartScreen()),
                    );
                  },
                ),
                SizedBox(height: 10.0),
                MobileCard(
                  modelName: 'Americano, Chocolate Donut, Banana Walnut Muffin',
                  brandName: 'Caffeine Kick Combo :',
                  price: 11.50,
                  rating: 5, // Rating in stars
                  imagePath: 'assets/caffeineCick.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CaffeineKickScreen()),
                    );
                  },
                ),
                SizedBox(height: 10.0),
                MobileCard(
                  modelName: 'Caramel Macchiato, Blueberry Muffin, Chocolate Chip Cookie',
                  brandName: 'Sweet Tooth Combo :',
                  price: 8.99,
                  rating: 4, // Rating in stars
                  imagePath: 'assets/sweetTooth.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SweetToothScreen()),
                    );
                  },
                ),
                SizedBox(height: 10.0),
                MobileCard(
                  modelName: 'Chai Latte, Spinach Feta Wrap, Tomato Basil Soup',
                  brandName: 'Savoury Combo :',
                  price: 11.50,
                  rating: 4, // Rating in stars
                  imagePath: 'assets/savourySip.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SavouryScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
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
                // Navigate to the menu screen
                // You can replace MenuScreen() with the appropriate route
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountScreen()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        },
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.brown,
      ),
    );
  }
}

class MobileCard extends StatelessWidget {
  final String modelName;
  final String brandName;
  final double price;
  final int rating; // New field for rating
  final String imagePath;
  final VoidCallback onTap;

  MobileCard({
    required this.modelName,
    required this.brandName,
    required this.price,
    required this.rating,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.brown[300], // Set the background color to red
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 150.0,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                    onPressed: () {
                      // Add to cart functionality
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$brandName $modelName',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Set the text color to white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: List.generate(
                      5,
                          (index) => Icon(
                        Icons.star,
                        color: index < rating ? Colors.yellow : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedImage extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onTap;

  RoundedImage({
    required this.label,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(
              imagePath,
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold, // Make the text bolder
            ),
          ),
        ],
      ),
    );
  }
}
