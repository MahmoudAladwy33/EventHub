
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/theme/app_text_styles.dart';

class InfoRow extends StatelessWidget {
  final IconData iconData;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String subtitle;

  const InfoRow({
    super.key,
    required this.iconData,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(iconData, color: iconColor, size: 22.sp),
        ),

        SizedBox(width: 14.w),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.font16BlackSemiBold.copyWith(
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              subtitle,
              style: AppTextStyles.font12GreyRegular.copyWith(fontSize: 13.sp),
            ),
          ],
        ),
      ],
    );
  }
}