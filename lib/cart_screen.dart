
import 'package:first_flutter_app/menulist.dart';
import 'package:flutter/material.dart';
import 'notifications_screen.dart';
import 'menu_screen.dart';
import 'account_screen.dart';

class CartScreen extends StatelessWidget {
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
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