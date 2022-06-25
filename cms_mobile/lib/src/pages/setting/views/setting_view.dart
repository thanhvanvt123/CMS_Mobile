import 'dart:ui';
import 'package:cms_mobile/src/pages/setting/controllers/setting_controller.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends GetView<SettingController> {
  final SharedStates sharedData = Get.find();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: 100),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.profileDetail);
            },
            child: Container(
              height: 55,
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ).copyWith(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 25,
                    color: Color(0xff114B5F),
                  ),
                  SizedBox(width: 15),
                  Text('My profile',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff114B5F),
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    size: 25,
                    color: Color(0xff114B5F),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 55,
              margin:
              EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 20),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.help, size: 25, color: Color(0xff114B5F)),
                  SizedBox(width: 15),
                  Text('History Event',
                      style: TextStyle(
                        fontSize: 10.0 * 1.7,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff114B5F),
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    size: 25,
                    color: Color(0xff114B5F),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.logOut();
              Get.toNamed(Routes.login);
            },
            child: Container(
              height: 55,
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ).copyWith(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.logout, size: 25, color: Color(0xff114B5F)),
                  SizedBox(width: 15),
                  Text('Logout',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff114B5F),
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    size: 25,
                    color: Color(0xff114B5F),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
