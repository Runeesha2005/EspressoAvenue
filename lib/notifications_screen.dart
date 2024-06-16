
import 'package:first_flutter_app/delivery.dart';
import 'package:flutter/material.dart';
import 'menulist.dart';
import 'account_screen.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make it bolder
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          NotificationCard(
            title: 'New Coffee Blend',
            message: 'Discover our new coffee blend "Sunrise Roast." Try it today!',
            time: '2 hours ago',
          ),
          NotificationCard(
            title: 'Barista Special',
            message: 'Todays special Buy one get one free on all espresso drinks!',
            time: 'Yesterday',
          ),
          NotificationCard(
            title: 'Coffee Tasting Event',
            message: 'Join us this weekend for a free coffee tasting event. Don\'t miss out!',
            time: '3 days ago',
          ),
          // Add more NotificationCard widgets as needed
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

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;

  NotificationCard({
    required this.title,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.brown[100], // Set the background color to light brown
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0, // Adjust the font size
          ),
        ),
        subtitle: Text(
          message,
          style: TextStyle(
            fontSize: 18.0, // Adjust the font size
          ),
        ),
        trailing: Text(
          time,
          style: TextStyle(
            fontSize: 16.0, // Adjust the font size
            color: Colors.grey,
          ),
        ),
        onTap: () {
          // Handle tapping on a notification
          // You can navigate to a detailed view or perform a specific action
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationsScreen(),
  ));
}