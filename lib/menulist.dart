import 'dart:convert';
import 'package:first_flutter_app/account_screen.dart';
import 'package:first_flutter_app/cart_screen.dart';
import 'package:first_flutter_app/delivery.dart';
import 'package:first_flutter_app/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

import 'menu_item_detail_screen.dart';
import 'menu_screen.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  List<dynamic> menuData = [];

  @override
  void initState() {
    super.initState();
    getMenuData().then((data) {
      setState(() {
        menuData = data;
      });
    });
  }

  Future<List<dynamic>> getMenuData() async {
    final String response = await rootBundle.loadString('assets/menu_data.json');
    final List<dynamic> data = json.decode(response);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: menuData.length,
        itemBuilder: (context, index) {
          final menuItem = menuData[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuItemDetailScreen(menuItem: menuItem)),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Image.asset(
                      menuItem['image'],
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menuItem['name'],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            menuItem['description'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '\$${menuItem['price'].toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                //Navigator.popUntil(context, ModalRoute.withName('/'));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MenuList()),
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

Future<void> writeToLocalStorage(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String?> readFromLocalStorage(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}
