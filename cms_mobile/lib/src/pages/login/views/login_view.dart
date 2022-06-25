import 'dart:ui';
import 'package:cms_mobile/src/pages/login/controllers/login_controller.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  final SharedStates sharedStates = Get.find();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            height: screenSize.height * 0.2,
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.15,
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: screenSize.width * 0.1),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: Text(
                    'Welcome To',
                    style: TextStyle(
                        color: Color(0xff114B5F),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 150),
            child: Image(
                width: screenSize.width * 1.2,
                height: screenSize.height * 0.5,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/login.jpg')),
          ),
          Container(
            margin: EdgeInsets.only(top: 420),
            height: screenSize.height * 0.5,
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  'Club Management System',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff114B5F),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: screenSize.width * 0.9,
            margin: EdgeInsets.only(top: 650, right: 30, left: 30),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue.shade500),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                onPressed: () {
                  controller.loginwithGoogle();
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.google,
                      size: 10.0 * 2.0,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    SizedBox(width: 50),
                    SizedBox(height: 30),
                    Text(
                      'Sign in with FPT Mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
