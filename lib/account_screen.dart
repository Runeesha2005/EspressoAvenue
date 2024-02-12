

import 'package:first_flutter_app/main.dart';
import 'package:flutter/material.dart';
import 'notifications_screen.dart';
import 'package:first_flutter_app/menu_screen.dart';
import 'menulist.dart';

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
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Espresso Avenue'),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your existing content
            // ...
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MenuScreen()),
                // );
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

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Theme(
          data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'My Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Make it bolder
                ),
              ),
              backgroundColor: Colors.brown,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/user1.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'User Information',
                    style: TextStyle(
                      fontSize: 24.0, // Increased font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    title: Text('Name'),
                    subtitle: Text('Runeesha Senadeera'),
                  ),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text('runeeshasenadeera@gmail.com'),
                  ),
                  Divider(),
                  Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 24.0, // Increased font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    title: Text('Change Password'),
                    onTap: () {
                      // Navigate to the change password screen
                    },
                  ),
                  ListTile(
                    title: Text('Notification Settings'),
                    onTap: () {
                      // Navigate to the notification settings screen
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Dark Mode'),
                    trailing: Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          isDarkMode = value;
                        });
                      },
                    ),
                  ),
                  Divider(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Sign Out'),
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MenuScreen()),
                      // );

                      // Navigate to home or perform home-related action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuList()),
                      );
                      // Navigate to home or perform home-related action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationsScreen()),
                      );
                      // Navigate to home or perform home-related action
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
          ),
        );
      },
    );
  }
}