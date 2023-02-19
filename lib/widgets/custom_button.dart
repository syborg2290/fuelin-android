import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? btnText;
  final VoidCallback? onTap;
  final Color? btnColor;
  final Color? onPrimaryColor;
  final Widget? btnDataRow;
  final bool? isLoading;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.btnText,
    this.btnColor = AppColors.primaryColor,
    this.btnDataRow,
    this.onPrimaryColor = AppColors.blackColor,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: isLoading! ? null : onTap,
        style: ElevatedButton.styleFrom(
          primary: btnColor,
          onPrimary: onPrimaryColor,
          minimumSize: Size(width, height * 0.08),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: isLoading!
            // ignore: prefer_const_constructors
            ? Center(
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : btnDataRow ??
                Center(
                  child: Text(
                    btnText!,
                    style: GoogleFonts.poppins(
                      color: AppColors.whiteColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
      ),
    );
  }
}
