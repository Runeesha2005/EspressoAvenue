import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'notifications_screen.dart';
import 'account_screen.dart';
import 'menulist.dart';
import 'delivery.dart';

class HealthyStartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Healthy Start Combo',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(
              'assets/healthyStart1.jpeg',
              height: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              'Healthy Start Combo',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Kick off your day with our refreshing Healthy Start Combo! This combo includes a nutritious avocado toast, a bowl of Greek yogurt with fresh berries, and a freshly squeezed green juice.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Combo Details',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Avocado Toast:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'A slice of whole grain toast topped with mashed avocado seasoned to perfection.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Greek Yogurt with Berries:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Creamy Greek yogurt served with a mix of fresh berries for a burst of flavor.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Fresh Green Juice:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'A revitalizing blend of kale, spinach, cucumber, celery, and apple juice.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle add to cart functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown, // Background color
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
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
                // Navigate to home or perform home-related action
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
