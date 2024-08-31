import 'package:flutter/material.dart';
import 'package:flutter_practice29_hw1/models/utils.dart';
import 'package:flutter_practice29_hw1/pages/home_page.dart';
import 'package:flutter_practice29_hw1/pages/login_page.dart';
import 'package:flutter_practice29_hw1/pages/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    checkSignIn();
    getResponse();
  }

  Future<void> getResponse() async {
    final response = await Utils.getSecuredUserInfo();
    Utils.d("Response1: ${response.toString()}");
  }

  Future<void> checkSignIn() async {
    // final response = await Utils.getData("signedIn");
    // Utils.d(response.toString());
    // final response2 = await Utils.getUser();
    // if (response.toString() == "true") {
    //   _isSignedIn = true;
    //   Utils.d(_isSignedIn.toString());
    // } else {
    //   _isSignedIn = false;
    // }

    // Utils.d(_isSignedIn.toString());
    // Utils.d(response2.toString());
    final response = await Utils.getData("signedIn");
    Utils.d("Responce: ${response.toString()}");
    _isSignedIn = response;
    Utils.d("Is signed in ${_isSignedIn.toString()}");
    if (_isSignedIn) {
      setState(() {
        currentIndex = 0;
      });
    } else {
      setState(() {
        currentIndex = 1;
      });
    }
  }

  final pageList = [HomePage(), LoginPage()];

  // void currentIndexFinder() {
  //   if (_isSignedIn) {
  //     currentIndex = 0;
  //   } else {
  //     currentIndex = 1;
  //   }
  //   Utils.d("Current index: ${currentIndex.toString()}");
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pageList[currentIndex],
      routes: {
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
        SignUpPage.id: (context) => SignUpPage(),
      },
    );
  }
}
