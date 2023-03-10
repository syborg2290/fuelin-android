import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fuelin_android/controllers/signup_controller.dart';
import 'package:fuelin_android/screens/home/home_screen.dart';
import 'package:fuelin_android/screens/login/login_screen.dart';
import 'package:fuelin_android/utils/custom_dialogs.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_field.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Get.put(SignupController());

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// app icon
                SizedBox(height: height * 0.05),
                Image.asset(
                  AppIcons.appLogo,
                  height: 50,
                ),
                const Text(
                  "Register on fuelin",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),

                /// Don't Have an Account text
                SizedBox(height: height * 0.01),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have registered?',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const WidgetSpan(child: SizedBox(width: 5.0)),
                      TextSpan(
                        text: 'Click here',
                        style: GoogleFonts.poppins(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(
                                const LoginScreen(),
                              ),
                      ),
                    ],
                  ),
                ),

                Form(
                  child: Column(
                    children: <Widget>[
                      /// full name field
                      SizedBox(height: height * 0.06),
                      CustomTextField(
                        controller: controller.nameController,
                        obscureText: false,
                        hintText: 'Full Name',
                        keyboardType: TextInputType.name,
                        prefixIconPath: AppIcons.userIcon,
                        suffixIcon: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill the field!';
                          }
                          return "";
                        },
                      ),

                      /// email field
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        controller: controller.emailController,
                        obscureText: false,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        prefixIconPath: AppIcons.emailIcon,
                        suffixIcon: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill the field!';
                          }
                          return "";
                        },
                      ),

                      /// password field
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        controller: controller.passwordController,
                        obscureText: true,
                        hintText: 'Password',
                        keyboardType: TextInputType.text,
                        prefixIconPath: AppIcons.lockIcon,
                        suffixIcon: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill the field!';
                          }
                          return "";
                        },
                      ),

                      /// con password field
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        controller: controller.confirmpasswordController,
                        obscureText: true,
                        hintText: 'Confirm Password',
                        keyboardType: TextInputType.text,
                        prefixIconPath: AppIcons.lockIcon,
                        suffixIcon: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill the field!';
                          }
                          return "";
                        },
                      ),

                      /// vehicle number field
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        controller: controller.confirmpasswordController,
                        obscureText: false,
                        hintText: 'Vehicle Number',
                        keyboardType: TextInputType.text,
                        prefixIconPath: AppIcons.vehicleIcon,
                        suffixIcon: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill the field!';
                          }
                          return "";
                        },
                      ),

                      /// nic field
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        controller: controller.nic,
                        obscureText: false,
                        hintText: 'NIC',
                        keyboardType: TextInputType.text,
                        prefixIconPath: AppIcons.idcardIcon,
                        suffixIcon: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill the field!';
                          }
                          return "";
                        },
                      ),

                      /// address field
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        controller: controller.address,
                        obscureText: false,
                        hintText: 'Address',
                        keyboardType: TextInputType.text,
                        prefixIconPath: AppIcons.idcardIcon,
                        suffixIcon: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill the field!';
                          }
                          return "";
                        },
                      ),

                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        controller: controller.mobileNoController,
                        obscureText: false,
                        hintText: 'Mobile Number',
                        keyboardType: TextInputType.text,
                        prefixIconPath: AppIcons.idcardIcon,
                        suffixIcon: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill the field!';
                          }
                          return "";
                        },
                      ),

                      SizedBox(height: height * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Container(
                          height: 50.0,
                          width: width,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: FutureBuilder(
                              future: controller.getAllResgiterVehicleType(),
                              builder: (context, snapshot) {
                                return DropdownButton<String>(
                                  isExpanded: true,
                                  items: snapshot.data?.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  hint: const Text("Vehicle type"),
                                  onChanged: (newValue) {
                                    controller.setSelectedVehiclType(newValue!);
                                  },
                                );
                              }),
                        ),
                      ),

                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        controller: controller.chassisNumber,
                        obscureText: false,
                        hintText: 'Chassis Number',
                        keyboardType: TextInputType.text,
                        prefixIconPath: AppIcons.idcardIcon,
                        suffixIcon: null,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill the field!';
                          }
                          return "";
                        },
                      ),

                      SizedBox(height: height * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Container(
                            height: 50.0,
                            width: width,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: FutureBuilder(
                                future: controller.getAllRegsiterFuelType(),
                                builder: (context, snapshot) {
                                  return DropdownButton<String>(
                                    isExpanded: true,
                                    items: snapshot.data?.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    hint: const Text("Fuel type"),
                                    onChanged: (newValue) {
                                      controller
                                          .setSelectedVehiclType(newValue!);
                                    },
                                  );
                                })),
                      ),

                      /// signup button
                      SizedBox(height: height * 0.05),

                      CustomButton(
                        onTap: () async {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const HomeScreen()),
                          // );
                          if (controller.emailController.text != "") {
                            final res = await controller.createUserController(
                              controller.nameController.text,
                              controller.passwordController.text,
                              controller.confirmpasswordController.text,
                              controller.emailController.text,
                              controller.mobileNoController.text,
                              controller.vehicleNumber.text,
                              controller.nic.text,
                              controller.address.text,
                              controller.selectedType.value,
                              controller.chassisNumber.text,
                              controller.fuelType.value,
                            );
                            if (res["status"]) {
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                          userRole: res["role"],
                                        )),
                              );
                            } else {
                              // ignore: use_build_context_synchronously
                              await CustomDialogs.showMyDialog(
                                  context, "Error", res["message"]);
                            }
                          } else {
                            await CustomDialogs.showMyDialog(context,
                                "Validation", "All fields are required!");
                          }
                        },
                        btnText: 'Register',
                        isLoading: controller.isLoadingSubmit.value,
                      ),
                    ],
                  ),
                ),

                /// Terms of services
                SizedBox(height: height * 0.03),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Signing Up, You agree our  ',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      TextSpan(
                        text: 'TERMS OF SERVICES',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor,
                          decoration: TextDecoration.underline,
                        ),

                        ///recognizer: TapGestureRecognizer(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
