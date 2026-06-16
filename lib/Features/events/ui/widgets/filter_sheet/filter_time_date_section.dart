
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/theme/app_colors.dart';
import '../../../../../Core/theme/app_text_styles.dart';

class FilterTimeDateSection extends StatelessWidget {
  final int selectedChip;
  final ValueChanged<int> onChipChanged;

  FilterTimeDateSection({
    super.key,
    required this.selectedChip,
    required this.onChipChanged,
  });

  final List<String> _chips = ['Today', 'Tomorrow', 'This week'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Time & Date',
          style: AppTextStyles.font16BlackSemiBold.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_chips.length, (index) {
            final isSelected = selectedChip == index;
            return GestureDetector(
              onTap: () => onChipChanged(index),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.greyLight,
                  ),
                ),
                child: Text(
                  _chips[index],
                  style: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.grey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 12.h),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.greyLight),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, color: AppColors.primary, size: 18.sp),
                  SizedBox(width: 12.w),
                  Text(
                    'Choose from calender',
                    style: AppTextStyles.font14PrimaryMedium.copyWith(
                      color: AppColors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, color: AppColors.grey, size: 14.sp),
            ],
          ),
        ),
      ],
    );
  }
}
