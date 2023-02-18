import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fuelin_android/constants/app_colors.dart';
import 'package:fuelin_android/constants/app_icons.dart';
import 'package:fuelin_android/controllers/login_controller.dart';
import 'package:fuelin_android/screens/forgot_password/forgot_password_screen.dart';
import 'package:fuelin_android/screens/home/home_screen.dart';
import 'package:fuelin_android/screens/signup/signup_screen.dart';
import 'package:fuelin_android/utils/custom_dialogs.dart';
import 'package:fuelin_android/widgets/custom_button.dart';
import 'package:fuelin_android/widgets/custom_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// app icon
                SizedBox(height: height * 0.05),
                Image.asset(
                  AppIcons.appLogo,
                  height: 200,
                ),

                /// Don't Have an Account text
                SizedBox(height: height * 0.01),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Need to register to the portal?',
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
                          color: AppColors.whiteColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(
                                const SignupScreen(),
                              ),
                      ),
                    ],
                  ),
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      /// email field
                      SizedBox(height: height * 0.06),
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

                      /// Login button
                      SizedBox(height: height * 0.05),
                      CustomButton(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final res = await controller.loginUser(
                              controller.emailController.text,
                              controller.passwordController.text,
                            );
                            if (res["status"]) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            } else {
                              CustomDialogs.showMyDialog(
                                  context,
                                  "Error With User Login",
                                  "Please check your credentials");
                            }
                          }
                        },
                        btnText: 'Login',
                        isLoading: false,
                      ),

                      /// forgot password Button
                      SizedBox(height: height * 0.01),
                      TextButton(
                        onPressed: () {
                          Get.to(const ForgotPasswordScreen());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteColor,
                          ),
                        ),
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
