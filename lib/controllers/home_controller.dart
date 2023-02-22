import 'package:fuelin_android/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fuelin_android/services/Consumer.service.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final selectedType = "".obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getInitialData();
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('user_role');
    prefs.remove('id');
    Get.off(() => const LoginScreen());
  }

  getInitialData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int role = prefs.getInt('user_role')!;
    int id = prefs.getInt('id')!;

    if (role == 3) {
      http.Response res = await getConsumerInformation(id);
    } else if (role == 2) {}
  }
}
