import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selectedType = "Bike".obs;
  final fuelType = "Petrol".obs;

  void setSelectedVehiclType(String value) {
    selectedType.value = value;
  }

  void setSelectedFuelType(String value) {
    fuelType.value = value;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController nic = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController chassisNumber = TextEditingController();
}
