import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final String prefixIconPath;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String Function(String?) validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.keyboardType,
    required this.prefixIconPath,
    this.suffixIcon,
    this.prefixIcon,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 50.0,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        style: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        validator: validator,
        obscureText: obscureText,
        cursorColor: AppColors.mainColor,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            fontSize: 10.0,
          ),
          // errorBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Colors.red),
          //   borderRadius: BorderRadius.circular(35.0),
          // ),
          border: InputBorder.none,
          // prefixIcon: Image.asset(prefixIconPath,
          //     height: 20.0, width: 20.0, color: Colors.grey, fit: BoxFit.none),
          prefixText: "  ",
          suffixIcon: suffixIcon ?? const SizedBox(),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.only(top: 16.0),
        ),
      ),
    );
  }
}
