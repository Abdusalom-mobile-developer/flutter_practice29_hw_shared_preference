import 'package:flutter/material.dart';
import 'package:flutter_practice29_hw1/pages/sign_up_page.dart';

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
        child: Text("Welcome home"),
      ),
    );
  }
}
