import 'package:flutter/material.dart';
import 'package:flutter_practice29_hw1/models/user.dart';
import 'package:flutter_practice29_hw1/models/utils.dart';
import 'package:flutter_practice29_hw1/pages/home_page.dart';
import 'package:flutter_practice29_hw1/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  static final String id = "sign_up_page";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _IsCurrentFullname = false;
  bool _IsCurrentEmail = false;
  bool _IsCurrentPhoneNumber = false;
  bool _isCurrentPassword = false;
  bool _IsCurrentConfirmPassword = false;

  Widget textFieldMaker(
      {required String hint,
      required IconData icon,
      required TextEditingController controller,
      required bool isCurrent}) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      decoration: BoxDecoration(
          border: Border.all(
              color: isCurrent ? Colors.blue : Colors.transparent, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(27)),
      child: TextField(
        controller: controller,
        onTap: () {
          if (hint == "Fullname") {
            setState(() {
              _IsCurrentFullname = true;
              _IsCurrentEmail = false;
              _IsCurrentPhoneNumber = false;
              _isCurrentPassword = false;
              _IsCurrentConfirmPassword = false;
            });
          } else if (hint == "Email address") {
            setState(() {
              _IsCurrentEmail = true;
              _IsCurrentFullname = false;
              _IsCurrentPhoneNumber = false;
              _isCurrentPassword = false;
              _IsCurrentConfirmPassword = false;
            });
          } else if (hint == "Phone number") {
            setState(() {
              _IsCurrentPhoneNumber = true;
              _IsCurrentFullname = false;
              _IsCurrentEmail = false;
              _isCurrentPassword = false;
              _IsCurrentConfirmPassword = false;
            });
          } else if (hint == "Password") {
            setState(() {
              _isCurrentPassword = true;
              _IsCurrentFullname = false;
              _IsCurrentEmail = false;
              _IsCurrentPhoneNumber = false;
              _IsCurrentConfirmPassword = false;
            });
          } else if (hint == "Confirm password") {
            setState(() {
              _IsCurrentConfirmPassword = true;
              _IsCurrentFullname = false;
              _IsCurrentEmail = false;
              _IsCurrentPhoneNumber = false;
              _isCurrentPassword = false;
            });
          }
        },
        onEditingComplete: () {
          setState(() {
            _IsCurrentConfirmPassword = false;
            _IsCurrentFullname = false;
            _IsCurrentEmail = false;
            _IsCurrentPhoneNumber = false;
            _isCurrentPassword = false;
          });
        },
        onTapOutside: (event) {
          setState(() {
            _IsCurrentConfirmPassword = false;
            _IsCurrentFullname = false;
            _IsCurrentEmail = false;
            _IsCurrentPhoneNumber = false;
            _isCurrentPassword = false;
          });
        },
        style: TextStyle(color: isCurrent ? Colors.blue : Colors.grey[400]),
        decoration: InputDecoration(
            focusColor: Colors.blue,
            hintText: hint,
            hintStyle:
                TextStyle(color: isCurrent ? Colors.blue : Colors.grey[400]),
            prefixIcon: Icon(
              icon,
              color: isCurrent ? Colors.blue : Colors.grey[400],
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                gapPadding:
                    BouncingScrollSimulation.maxSpringTransferVelocity)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(18),
        width: double.infinity,
        color: Color(0xF3F6F9FF),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 248, 249),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 2, color: Colors.blue[600]!),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, HomePage.id);
                      },
                      icon: Icon(Icons.arrow_back_outlined,
                          color: Colors.grey[800], size: 32))
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Let's Get Started!",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Create an account to Q Allure to get all features",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      textFieldMaker(
                          hint: "Fullname",
                          icon: Icons.person_2_outlined,
                          controller: _fullnameController,
                          isCurrent: _IsCurrentFullname),
                      textFieldMaker(
                          hint: "Email address",
                          icon: Icons.email_outlined,
                          controller: _emailController,
                          isCurrent: _IsCurrentEmail),
                      textFieldMaker(
                          hint: "Phone number",
                          icon: Icons.phone_android,
                          controller: _phoneNumberController,
                          isCurrent: _IsCurrentPhoneNumber),
                      textFieldMaker(
                          hint: "Password",
                          icon: Icons.lock_open,
                          controller: _passwordController,
                          isCurrent: _isCurrentPassword),
                      textFieldMaker(
                          hint: "Confirm password",
                          icon: Icons.lock_open,
                          controller: _confirmPasswordController,
                          isCurrent: _IsCurrentConfirmPassword),
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
                              FullUser securedUserInfo = FullUser(
                                  _fullnameController.text,
                                  _emailController.text,
                                  _phoneNumberController.text,
                                  _passwordController.text,
                                  _confirmPasswordController.text);

                              final json =
                                  Utils.toJsonSecure(user: securedUserInfo);
                              Utils.secureStoreUser(json);
                              Navigator.pushReplacementNamed(
                                  context, HomePage.id);
                              Utils.storeData("signedIn", true);
                            },
                            child: Text(
                              "Create",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginPage.id);
                            },
                            child: Text("Login here",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
