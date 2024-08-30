import 'package:flutter/material.dart';
import 'package:flutter_practice29_hw1/models/user.dart';
import 'package:flutter_practice29_hw1/models/utils.dart';
import 'package:flutter_practice29_hw1/pages/home_page.dart';
import 'package:flutter_practice29_hw1/pages/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  static final String id = "login_page";
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isChangingEmail = false;
  bool _isChangingPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(18),
        width: double.infinity,
        color: Color(0xF3F6F9FF),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 247, 248, 249),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: 2, color: Colors.blue[600]!)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/image_top.png"),
                  height: 200,
                ),
                Text("Welcome back!",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Log in to your existant account of Q Allure",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: _isChangingEmail
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(27)),
                  child: TextField(
                    controller: _emailAddressController,
                    onTap: () {
                      setState(() {
                        _isChangingEmail = true;
                        _isChangingPassword = false;
                      });
                    },
                    onEditingComplete: () {
                      setState(() {
                        _isChangingEmail = false;
                      });
                    },
                    onTapOutside: (event) {
                      setState(() {
                        _isChangingEmail = false;
                        _isChangingPassword = false;
                      });
                    },
                    style: TextStyle(
                        color:
                            _isChangingEmail ? Colors.blue : Colors.grey[400]),
                    decoration: InputDecoration(
                        focusColor: Colors.blue,
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                            color: _isChangingEmail
                                ? Colors.blue
                                : Colors.grey[400]),
                        prefixIcon: Icon(
                          Icons.person_2_outlined,
                          color:
                              _isChangingEmail ? Colors.blue : Colors.grey[400],
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            gapPadding: BouncingScrollSimulation
                                .maxSpringTransferVelocity)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: _isChangingPassword
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(27)),
                  child: TextField(
                    controller: _passwordController,
                    onTap: () {
                      setState(() {
                        _isChangingPassword = true;
                        _isChangingEmail = false;
                      });
                    },
                    onEditingComplete: () {
                      setState(() {
                        _isChangingPassword = false;
                      });
                    },
                    onTapOutside: (event) {
                      setState(() {
                        _isChangingEmail = false;
                        _isChangingPassword = false;
                      });
                    },
                    style: TextStyle(
                        color: _isChangingPassword
                            ? Colors.blue
                            : Colors.grey[400]),
                    decoration: InputDecoration(
                        focusColor: Colors.blue,
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: _isChangingPassword
                                ? Colors.blue
                                : Colors.grey[400]),
                        prefixIcon: Icon(
                          Icons.lock_open_outlined,
                          color: _isChangingPassword
                              ? Colors.blue
                              : Colors.grey[400],
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            gapPadding: BouncingScrollSimulation
                                .maxSpringTransferVelocity)),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(28)),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 55,
                  child: TextButton(
                      onPressed: () {
                        Utils.storeData("signedIn", true);
                        User user = User(_emailAddressController.text,
                            _passwordController.text);
                        final json = Utils.toJson(user: user);
                        Utils.storeUser(json);
                        Navigator.pushReplacementNamed(context, HomePage.id);
                      },
                      child: Text(
                        "LOG IN",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Or connect using",
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue[900],
                          borderRadius: BorderRadius.circular(12)),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.facebook,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Facebook",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ])),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.red[900],
                          borderRadius: BorderRadius.circular(12)),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/image.png'),
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Google",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ])),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpPage.id);
                      },
                      child: Text("Sign Up",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
