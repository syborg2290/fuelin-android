import 'dart:async';

import 'package:fuelin_android/screens/login/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Timer(
      const Duration(seconds: 3),
      () => Get.off(
       const LoginScreen(),
      ),
    );
  }
}
