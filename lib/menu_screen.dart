

import 'package:first_flutter_app/discount_screen.dart';
import 'package:first_flutter_app/points_screen.dart';
import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'notifications_screen.dart';
import 'account_screen.dart';
import 'menulist.dart'; // Import the MenuList page

class MenuScreen extends StatelessWidget {


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
      body: ListView(
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
          ),
          SizedBox(height: 10.0),
          MobileCard(
            modelName: 'Green Tea, Avocado Toast, Fresh Fruit Salad',
            brandName: 'Healthy Start Combo :',
            price: 7.50,
            rating: 5, // Rating in stars
            imagePath: 'assets/healthyStart1.jpeg',
          ),
          SizedBox(height: 10.0),
          MobileCard(
            modelName: 'Americano, Chocolate Donut, Banana Walnut Muffin',
            brandName: 'Caffeine Kick Combo :',
            price: 11.50,
            rating: 5, // Rating in stars
            imagePath: 'assets/caffeineCick.jpg',
          ),
          SizedBox(height: 10.0),
          MobileCard(
            modelName: 'Caramel Macchiato, Blueberry Muffin, Chocolate Chip Cookie',
            brandName: 'Sweet Tooth Combo :',
            price: 8.99,
            rating: 4, // Rating in stars
            imagePath: 'assets/sweetTooth.jpg',
          ),
          SizedBox(height: 10.0),
          MobileCard(
            modelName: 'Chai Latte, Spinach Feta Wrap, Tomato Basil Soup',
            brandName: 'Savoury Combo :',
            price: 11.50,
            rating: 4, // Rating in stars
            imagePath: 'assets/savourySip.jpg',
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

// ... rest of your existing code

class MobileCard extends StatelessWidget {
  final String modelName;
  final String brandName;
  final double price;
  final int rating; // New field for rating
  final String imagePath;

  MobileCard({
    required this.modelName,
    required this.brandName,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.brown[300], // Set the background color to red
      child: InkWell(
        onTap: () {
          // Handle the tap on the mobile card
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 150.0,
              width: double.infinity,
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

