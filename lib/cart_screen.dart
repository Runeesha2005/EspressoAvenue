import 'package:first_flutter_app/delivery.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

import 'notifications_screen.dart';
import 'account_screen.dart';
import 'menulist.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String _location = 'Press button to get location';
  String _contactInfo = 'Press button to get contact info';

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _location = 'Location services are disabled.';
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _location = 'Location permissions are denied.';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _location = 'Location permissions are permanently denied.';
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _location = 'Lat: ${position.latitude}, Long: ${position.longitude}';
    });
  }

  Future<void> _getContactInformation() async {
    var status = await Permission.contacts.request();

    if (status.isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();

      if (contacts.isNotEmpty) {
        Contact contact = contacts.first;
        setState(() {
          _contactInfo = 'Name: ${contact.displayName}\nPhone: ${contact.phones?.first.value ?? 'N/A'}';
        });
      } else {
        setState(() {
          _contactInfo = 'No contacts found.';
        });
      }
    } else if (status.isDenied) {
      setState(() {
        _contactInfo = 'Contacts permission denied.';
      });
    } else {
      setState(() {
        _contactInfo = 'Contacts permission permanently denied.';
      });
      openAppSettings(); // Opens settings so the user can grant the permission manually
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make it bolder
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  CartItem(
                    productName: 'Cappuccino',
                    price: 4.99,
                    quantity: 2,
                  ),
                  CartItem(
                    productName: 'Latte',
                    price: 5.99,
                    quantity: 1,
                  ),
                  CartItem(
                    productName: 'Chocolate Chip Pancakes',
                    price: 6.99,
                    quantity: 3,
                  ),
                  // Add more CartItem widgets as needed
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 10),
                  Text('Get Location'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              _location,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _getContactInformation,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.contacts),
                  SizedBox(width: 10),
                  Text('Get Contact Info'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              _contactInfo,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
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

class CartItem extends StatelessWidget {
  final String productName;
  final double price;
  final int quantity;

  CartItem({
    required this.productName,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    double total = price * quantity;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.brown[50],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Product: $productName',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Price: \$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.brown[300],
              ),
            ),
            Text(
              'Quantity: $quantity',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.brown[300],
              ),
            ),
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.brown[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
