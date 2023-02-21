import 'dart:async';

import 'package:fuelin_android/screens/home/home_screen.dart';
import 'package:fuelin_android/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 3), () => checkIsLogged());
  }

  checkIsLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('name') != null &&
        prefs.getInt('user_role') != null &&
        prefs.getInt('id') != null) {
      Get.off(() => HomeScreen(
            userRole: prefs.getInt('user_role')!,
          ));
    } else {
      Get.off(
        const LoginScreen(),
      );
    }
  }
}
