


import 'package:flutter/material.dart';
import 'notifications_screen.dart';
import 'package:first_flutter_app/menu_screen.dart';
import 'account_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Espresso Avenue',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: MenuList(),
    );
  }
}

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu List',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make it bolder
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          MenuItemCard(
            itemName: 'Cappuccino',
            price: 4.99,
          ),
          MenuItemCard(
            itemName: 'Bubble Tea',
            price: 3.50,
          ),
          MenuItemCard(
            itemName: 'Americano',
            price: 2.99,
          ),
          MenuItemCard(
            itemName: 'Tuna Sandwich',
            price: 7.99,
          ),
          MenuItemCard(
            itemName: 'Cheese and Onion Sandwich',
            price: 6.99,
          ),
          MenuItemCard(
            itemName: 'Chai Tea',
            price: 4.50,
          ),
          MenuItemCard(
            itemName: 'Fresh Juice',
            price: 5.99,
          ),
          MenuItemCard(
            itemName: 'Espresso',
            price: 3.99,
          ),
          MenuItemCard(
            itemName: 'Mocha',
            price: 5.49,
          ),
          MenuItemCard(
            itemName: 'Chicken Caesar Salad',
            price: 8.99,
          ),
          MenuItemCard(
            itemName: 'Fruit Parfait',
            price: 4.99,
          ),
          MenuItemCard(
            itemName: 'Latte',
            price: 5.99,
          ),
          MenuItemCard(
            itemName: 'Hot Chocolate',
            price: 4.49,
          ),
          MenuItemCard(
            itemName: 'Iced Coffee',
            price: 3.99,
          ),
          MenuItemCard(
            itemName: 'Turkey Club Sandwich',
            price: 9.99,
          ),
          MenuItemCard(
            itemName: 'Bagel with Cream Cheese',
            price: 2.49,
          ),
          MenuItemCard(
            itemName: 'Matcha Green Tea',
            price: 6.50,
          ),
          MenuItemCard(
            itemName: 'Vegetarian Wrap',
            price: 7.49,
          ),
          MenuItemCard(
            itemName: 'Smoothie Bowl',
            price: 8.50,
          ),
          MenuItemCard(
            itemName: 'Cold Brew Coffee',
            price: 4.99,
          ),
          MenuItemCard(
            itemName: 'Chocolate Chip Pancakes',
            price: 6.99,
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

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MenuScreen()),
                // );
                // // Navigate to the home screen or perform home-related action
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

class MenuItemCard extends StatelessWidget {
  final String itemName;
  final double price;

  MenuItemCard({
    required this.itemName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      color: Colors.brown[300],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              itemName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

