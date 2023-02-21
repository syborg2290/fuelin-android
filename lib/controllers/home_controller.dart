import 'package:fuelin_android/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final selectedType = "".obs;

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('user_role');
    prefs.remove('id');
    Get.off(() => const LoginScreen());
  }

  getInitialData() async {}
}
