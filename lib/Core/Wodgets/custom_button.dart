
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          elevation: 2,
        ),
        onPressed: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Centered Text
            Text(
              text.toUpperCase(),
              style: AppTextStyles.font18WhiteMedium.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 30.w,
                height: 30.w,
                decoration: const BoxDecoration(
                  color: AppColors.buttonAccent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                  size: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}