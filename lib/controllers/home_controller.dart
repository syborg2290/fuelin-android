import 'package:fuelin_android/screens/login/login_screen.dart';
import 'package:fuelin_android/services/Common.service.dart';
import 'package:fuelin_android/services/Station.service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fuelin_android/services/Consumer.service.dart';
import 'dart:convert';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin {
  final selectedType = "".obs;
  RxBool isLoading = true.obs;
  final initialData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    getInitialData();
  }

  // startBardcodeScanner() async {
  //   String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //       '0xffe17055', "Cancel", true, ScanMode.QR);
  //   print(barcodeScanRes);
  // }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('user_role');
    prefs.remove('id');
    Get.off(() => const LoginScreen());
  }

  getAllResgiterVehicleType() async {
    http.Response res = await getAllVehicleType();
    final list = jsonDecode(res.body)["data"]["vehical_types"];
    return list;
  }

  getAllRegsiterFuelType() async {
    http.Response res = await getAllFuelType();
    final list = jsonDecode(res.body)["data"]["types"];
    return list;
  }

  getInitialData() async {
    change(null, status: RxStatus.loading());
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int role = prefs.getInt('user_role')!;
    int id = prefs.getInt('id')!;

    if (role == 3) {
      http.Response res = await getConsumerInformation(id);
      final resData = jsonDecode(res.body)["data"];
      int customerId = resData["customer"]["customer"]["id"];
      String name = resData["customer"]["customer"]["full_name"];
      String vehicle_no = resData["customer"]["customer"]["vehical_number"];
      String vehicle_type = resData["customer"]["customer"]["vehical_type"];
      int fuel_type = resData["customer"]["customer"]["fuel_type_id"];
      int quota_limit = resData["customer"]["customer"]["quota"]["qty"];
      int quota_used = resData["customer"]["customer"]["quota"]["use_qty"];
      String customer_code = resData["customer"]["customer"]["code"];

      String vehicle_type_name = (await getAllResgiterVehicleType())
          .where((o) => o['name'] == vehicle_type)
          .toList()[0]["name"];

      String fuel_type_name = (await getAllRegsiterFuelType())
          .where((o) => o['id'] == fuel_type)
          .toList()[0]["name"];

      initialData.value = {
        "customerId": customerId,
        "name": name,
        "vehicle_no": vehicle_no,
        "vehicle_type": vehicle_type_name,
        "fuel_type": fuel_type_name,
        "quota_limit": quota_limit,
        "quota_used": quota_used,
        "customer_code": customer_code
      };
      initialData.value["type"] = "customer";
      change(null, status: RxStatus.success());
    } else if (role == 2) {
      http.Response res = await getStationInformation(id);
      final resData = jsonDecode(res.body)["data"];
      initialData.value = resData["user"]["station"];
      initialData.value["type"] = "station";
      change(null, status: RxStatus.success());
    }
  }
}
