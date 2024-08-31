import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Text(
          "Welcome home",
          style: TextStyle(
              color: Colors.grey[800],
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
