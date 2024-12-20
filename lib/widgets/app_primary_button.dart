import 'package:ecommerce_refuerzo_bloc/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double? heightButton;
  final double? fontSizeButton;

  const AppPrimaryButton({
    super.key,
    required this.onTap,
    required this.text,
    this.heightButton = 50,
    this.fontSizeButton = 14,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: heightButton,
        decoration: BoxDecoration(
          color: AppColors.lime,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.black,
              fontSize: fontSizeButton,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
