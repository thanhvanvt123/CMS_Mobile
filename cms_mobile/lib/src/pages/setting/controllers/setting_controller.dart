import 'package:bot_toast/bot_toast.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingController extends GetxController {
  Future<void> logOut() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    BotToast.showText(text: "Đăng xuất thành công");
    Get.toNamed(Routes.login);
  }
}
