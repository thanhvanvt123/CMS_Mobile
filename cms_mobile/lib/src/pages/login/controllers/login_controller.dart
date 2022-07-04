import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/paging.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:cms_mobile/src/models/rolename.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/services/api/account_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:cms_mobile/src/util/utils.dart';

class LoginController extends GetxController {
  // Share states across app
  final SharedStates sharedStates = Get.find();
  final IAccountService _accountService = Get.find();

  // User login in app
  Account? account;
  final FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn? _googleSignIn;
  // Show password
  final isShowPass = true.obs;
  //final String email, password, validCredentials = "";

  // Save change show password
  void changeIshowPass() {
    isShowPass.value = !isShowPass.value;
  }


  Paging? _paging;

  ImagePicker _imagePicker = Get.find();
  final filePath = ''.obs;

  Future<void> getImage() async {
    final picked = await _imagePicker.pickImage(source: ImageSource.gallery);
    filePath.value = picked?.path ?? '';
    uploadFile(File(picked!.path));
  }

  var urlImageUpload = "".obs;

  Future uploadFile(File file) async {
    if (file == null) return;
    final fileName = basename(file.path);
    try {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child('uploads/$fileName')
          .putFile(file);
      if (task == null) {
        return null;
      }
      ;
      final snapshot = await task.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      urlImageUpload.value = urlDownload;
      print('Download-Link: $urlDownload');
    } on FirebaseException catch (e) {
      print('lỗi: ' + e.toString());
    }
  }

  void loginwithGoogle() async {
    DateTime applyDate = DateTime.now();

    try {
      BotToast.showLoading();
      _googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn!.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final user = FirebaseAuth.instance.currentUser!;
      Map<String, Map<String, dynamic>> userLogin = {
        "userLogin": {
          "email": user.email!.toLowerCase(),
          "fullname": user.displayName,
          "phoneNumber": user.phoneNumber,
          "avatarUrl": user.photoURL,
        }
      };
      Account? createResult = await _accountService.createAccount(userLogin);
      String? b_token = await _accountService.createAccount2(userLogin);
      sharedStates.account = createResult;
      sharedStates.token = b_token!;
      if (createResult != null && sharedStates.account!.accountStatus == 'Đang hoạt động') {
        List o = sharedStates.account!.role!.toList();
        for (Map<String, dynamic> item in o) {
          if (item.values.elementAt(1) == 3) {
            BotToast.showText(text: "Đăng nhập thành công");
            Get.toNamed(Routes.home);
          } else {
            BotToast.showText(text: "Đăng nhập thất bại");
          }
        }
      }
    } catch (e) {
      BotToast.showText(text: "Your account not belong to FPT university!");
    }
    BotToast.closeAllLoading();
  }
}

mixin LoginScreen {}
