import 'dart:ui';
import 'package:cms_mobile/src/pages/introduction/controllers/introduction_controller.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionPage extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 60),
          child: Image(
              width: screenSize.width * 1.2,
              height: screenSize.height * 0.6,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/login.jpg')),
          ),
          
          Container(
            margin: EdgeInsets.only(top: 500),
            padding: const EdgeInsets.all(15),
            // child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: screenSize.height * 0.2,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.2,
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 20),
                      Text(
                        'CMS',
                        style:
                            TextStyle(color: Color(0xff114B5F), fontSize: 70, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only( right: 30, left: 30),
                  height: 45,
                  width: screenSize.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF0C9869)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.login);
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            //),
          ),
        ],
      ),
    );
  }
}
