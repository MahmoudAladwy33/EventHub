
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/theme/app_colors.dart';
import '../../../../Core/theme/app_text_styles.dart';

class AttendeesRow extends StatelessWidget {
  const AttendeesRow({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Color> avatarColors = [
      const Color(0xFFE8A87C),
      const Color(0xFFB5838D),
      const Color(0xFF6D9DC5),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: (avatarColors.length * 24 + 12).w,
            height: 36.h,
            child: Stack(
              children: List.generate(avatarColors.length, (i) {
                return Positioned(
                  left: (i * 20).w,
                  child: Container(
                    width: 36.w,
                    height: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: avatarColors[i],
                      border: Border.all(color: AppColors.white, width: 2),
                    ),
                    child: Icon(
                      Icons.person,
                      color: AppColors.white,
                      size: 18.sp,
                    ),
                  ),
                );
              }),
            ),
          ),

          SizedBox(width: 10.w),

          Text(
            '+20 Going',
            style: AppTextStyles.font14PrimaryMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),

          const Spacer(),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              elevation: 0,
            ),
            child: Text(
              'Invite',
              style: AppTextStyles.font14PrimaryMedium.copyWith(
                color: AppColors.white,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}