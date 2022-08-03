import 'package:bot_toast/bot_toast.dart';
import 'package:cms_mobile/src/common/app_init.dart';
import 'package:cms_mobile/src/common/constants.dart';
import 'package:cms_mobile/src/common/strings.dart';
import 'package:cms_mobile/src/routes/app_pages.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  AppInit.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: Fonts.montserrat),
      navigatorObservers: [BotToastNavigatorObserver()],
       initialRoute: Routes.introduction,
      //initialRoute: Routes.eventDetail,
      getPages: AppPages.routes,
    );
  }
}

