import 'package:flutter/material.dart';
import 'package:fuelin_android/services/Auth.service.dart';
import 'package:fuelin_android/services/Common.service.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var allVehicleTypes = [];
  var allFuelTypes = [];
  final selectedType = "".obs;
  final fuelType = "".obs;
  final isLoadingSubmit = false.obs;

  void setSelectedVehiclType(String value) {
    selectedType.value = value;
  }

  void setSelectedFuelType(String value) {
    fuelType.value = value;
  }

  void setLoadingSubmit(bool value) {
    isLoadingSubmit.value = value;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController nic = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController chassisNumber = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<List<String>> getAllResgiterVehicleType() async {
    http.Response res = await getAllVehicleType();
    final list = jsonDecode(res.body)["data"]["vehical_types"];
    final List<String> typesList =
        list.map((el) => el["name"]).toList().cast<String>();
    setSelectedVehiclType(typesList[0]);
    allVehicleTypes = list;
    return typesList;
  }

  Future<List<String>> getAllRegsiterFuelType() async {
    http.Response res = await getAllFuelType();
    final list = jsonDecode(res.body)["data"]["types"];
    final List<String> typesList =
        list.map((el) => el["name"]).toList().cast<String>();
    setSelectedFuelType(typesList[0]);
    allFuelTypes = list;
    return typesList;
  }

  Future<dynamic> createUser(
    String name,
    String password,
    String comPassword,
    String email,
    String mobile_no,
    String vehicle_number,
    String nic,
    String address,
    String vehical_type,
    String chassis_number,
    String fuel_type,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final vehicleTypeId = allVehicleTypes
        .where((element) =>
            element.name.toLowerCase().contains(vehical_type.toLowerCase()))
        .toList();
    final fuelTypeId = allFuelTypes
        .where((element) =>
            element.name.toLowerCase().contains(vehical_type.toLowerCase()))
        .toList();
    http.Response res = await registerUser(
      name,
      password,
      comPassword,
      email,
      mobile_no,
      vehicle_number,
      nic,
      address,
      vehicleTypeId[0].id,
      chassis_number,
      fuelTypeId[0].id,
    );
    if (jsonDecode(res.body)["success"]) {
      final resData = jsonDecode(res.body)["data"];
      prefs.setString('name', resData['name']);
      prefs.setString('user_role', resData['user_role']);
      prefs.setString('id', resData['id']);
      return {"status": true, "message": "success"};
    } else {
      return {"status": false, "message": jsonDecode(res.body)["message"]};
    }
  }
}
