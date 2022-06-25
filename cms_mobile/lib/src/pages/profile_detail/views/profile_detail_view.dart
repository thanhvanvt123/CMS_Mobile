import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/pages/profile_detail/controllers/profile_detail_controller.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:io';

class ProfileDetailPage extends GetView<ProfileDetailController> {
  final SharedStates sharedData = Get.find();
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    //final Account? user = sharedData.account;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        bottomOpacity: 50,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Colors.transparent,
          splashRadius: 30,
          iconSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF114B5F),
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(65, 0, 0, 0),
          child: Text(
            'Profile',
            style: TextStyle(
              //fontFamily: 'Roboto',
              color: Color(0xFF114B5F),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      //backgroundColor: TextStyle.primaryBtnText,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                child: Container(
                  width: 400,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.blue.shade400,
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 4),
                                      child: Text(
                                          (user.isNull)
                                              ? 'Username loading'
                                              : user!.displayName!,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      child: Text(
                                          (user.isNull)
                                              ? 'Not updated'
                                              : 'Email: ' + user!.email!,
                                          style: TextStyle(
                                            color: Color(0xFF114B5F),
                                            fontSize: 15,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      child: Text(
                                          // (user == null)
                                          //     ? 'Not updated'
                                          //     : user!.phoneNumber!,
                                          'Phone: Not updated',
                                          style: TextStyle(
                                            color: Color(0xFF114B5F),
                                            fontSize: 15,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 20, 30),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          // child: Image.network(
                          //   'https://picsum.photos/seed/607/600',
                          //   width: 120,
                          //   height: 180,
                          //   fit: BoxFit.cover,
                          // ),
                          child: Image(
                            image: (user == null)
                                ? NetworkImage(
                                    'https://pngimg.com/uploads/mouth_smile/mouth_smile_PNG42.png')
                                : NetworkImage(user!.photoURL!),
                            width: 100,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: CustomBottombar(),
    );
  }
}
