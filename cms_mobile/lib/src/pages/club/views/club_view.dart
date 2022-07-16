import 'dart:ui';
import 'package:cms_mobile/src/pages/club/controllers/club_controller.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:cms_mobile/src/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubPage extends GetView<ClubController> {
  final SharedStates sharedData = Get.find();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0C9869).withOpacity(0.5),
        foregroundColor: Color(0xFF0C9869).withOpacity(0.05),
        centerTitle: true,
        title: Text(
          'Câu lạc bộ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff114B5F),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: CustomBottombar(),
    );
  }
}
