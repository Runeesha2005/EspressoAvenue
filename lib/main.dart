import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_app/menu_screen.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core

void main() async {
  // Initialize Firebase before runApp
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //print("Firebase initialized successfully");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Espresso Avenue',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: Color(0xFFD2B48C), // Light brown color
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage('assets/logo.jpg'),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        fillColor: Colors.brown[50]?.withOpacity(0.7) ?? Colors.transparent,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        fillColor: Colors.brown[50]?.withOpacity(0.7) ?? Colors.transparent,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 25.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown, // Dark brown background
                          foregroundColor: Colors.white, // White text
                          textStyle: TextStyle(fontSize: 18.0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.0),
                          shadowColor: Colors.brown,
                        ).copyWith(
                          overlayColor: MaterialStateProperty.all(Color(0xFFDEB887)), // Light brown on hover
                        ),
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MenuScreen()),
                            );
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Login Failed'),
                                  content: Text('Invalid email or password.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text('Login'),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown, // Dark brown background
                          foregroundColor: Colors.white, // White text
                          textStyle: TextStyle(fontSize: 18.0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.0),
                          shadowColor: Colors.brown,
                        ).copyWith(
                          overlayColor: MaterialStateProperty.all(Color(0xFFDEB887)), // Light brown on hover
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          'Register Now',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Now'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: Color(0xFFD2B48C), // Light brown color
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown, // Dark brown background
                          foregroundColor: Colors.white, // White text
                          textStyle: TextStyle(fontSize: 18.0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.0),
                          shadowColor: Colors.brown,
                        ).copyWith(
                          overlayColor: MaterialStateProperty.all(Color(0xFFDEB887)), // Light brown on hover
                        ),
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            // Registration successful, navigate to login page
                            Navigator.pop(context); // Go back to the login page
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Registration Failed'),
                                  content: Text(e.toString()),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text('Register'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
