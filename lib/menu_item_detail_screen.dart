import 'package:first_flutter_app/menulist.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/account_screen.dart';
import 'package:first_flutter_app/cart_screen.dart';
import 'package:first_flutter_app/delivery.dart';
import 'package:first_flutter_app/notifications_screen.dart';
import 'package:first_flutter_app/menu_screen.dart';

class MenuItemDetailScreen extends StatelessWidget {
  final dynamic menuItem;

  const MenuItemDetailScreen({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem['name']),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                menuItem['image'],
                width: double.infinity,
                height: 300.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              menuItem['name'],
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              menuItem['description'],
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              menuItem['details']['ingredients'],
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Price:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$${menuItem['price'].toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add to cart functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // background (button) color
                  foregroundColor: Colors.white, // foreground (text) color
                ),
                child: Text('Add to Cart'),
              ),
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
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            IconButton(
              icon: Icon(Icons.menu_book, color: Colors.white),
              onPressed: () {
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
