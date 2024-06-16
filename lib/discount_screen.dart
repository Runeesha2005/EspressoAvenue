import 'package:first_flutter_app/menulist.dart';
import 'package:flutter/material.dart';
import 'notifications_screen.dart';
import 'account_screen.dart';
import 'cart_screen.dart';
import 'delivery.dart';

class DiscountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discounts',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make it bolder
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Exclusive Loyal Customer Discounts!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              DiscountCard(
                title: 'Free Coffee Friday',
                description: 'Buy 4 coffees during the week and get a FREE coffee on Friday!',
                imagePath: 'assets/coffee1.png',
              ),
              DiscountCard(
                title: 'Double Points Weekend',
                description: 'Earn double loyalty points for every purchase over the weekend.',
                imagePath: 'assets/coffee2.jpg',
              ),
              DiscountCard(
                title: 'Mystery Monday',
                description: 'Unlock a mystery discount every Monday with your loyalty card.',
                imagePath: 'assets/coffee4.jpg',
              ),
              DiscountCard(
                title: 'Happy Hour Special',
                description: 'Enjoy special discounts on all drinks during our happy hour, 3 PM - 6 PM.',
                imagePath: 'assets/coffee5.png',
              ),
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

class DiscountCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  DiscountCard({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.brown[100],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 10.0),
            Image.asset(
              imagePath,
              height: 150.0, // Adjust the height as needed
              width: 150.0,  // Adjust the width as needed
            ),
            SizedBox(height: 10.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.brown[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
