import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fuelin_android/screens/home/home_screen.dart';
import 'package:fuelin_android/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class SplashController extends GetxController {
  var getResult = 'QR Code Result'.obs;

  @override
  void onInit() {
    super.onInit();

    // Timer(const Duration(seconds: 3), () => checkIsLogged());
    scanQRCode();
  }

  //  startBardcodeScanner() async {
  //   String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //       '0xffe17055', "Cancel", true, ScanMode.BARCODE);
  //   print(barcodeScanRes);
  // }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      getResult.value = qrCode;

      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult.value = 'Failed to scan QR Code.';
    }
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
