
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/theme/app_colors.dart';
import '../../../../Core/theme/app_text_styles.dart';

class OrganizerRow extends StatelessWidget {
  const OrganizerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: const Color(0xFF6B4F3A),
          ),
          child: Icon(Icons.person, color: AppColors.white, size: 26.sp),
        ),

        SizedBox(width: 14.w),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ashfak Sayem',
              style: AppTextStyles.font16BlackSemiBold.copyWith(
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Organizer',
              style: AppTextStyles.font12GreyRegular.copyWith(fontSize: 13.sp),
            ),
          ],
        ),

        const Spacer(),

        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(7.r),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(
                    74,
                    210,
                    228,
                    0.08,
                  ),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Text(
               "follow",
                style: AppTextStyles.font12GreyRegular.copyWith(
                    color: AppColors.primary
                )
            ),
          ),
        )
      ],
    );
  }
}