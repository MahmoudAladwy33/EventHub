
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/theme/app_colors.dart';
import '../../../../../Core/theme/app_text_styles.dart';

class FilterCategoriesRow extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;

  FilterCategoriesRow({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Sports', 'icon': Icons.sports_basketball_outlined},
    {'name': 'Music', 'icon': Icons.music_note_outlined},
    {'name': 'Art', 'icon': Icons.palette_outlined},
    {'name': 'Food', 'icon': Icons.restaurant_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final isSelected = _categories[index]['name'] == selectedCategory;
              return GestureDetector(
                onTap: () {
                  onCategoryChanged(_categories[index]['name']);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Column(
                    children: [
                      Container(
                        width: 54.w,
                        height: 54.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected ? AppColors.primary : AppColors.white,
                          border: Border.all(
                            color: isSelected ? AppColors.primary : AppColors.greyLight,
                            width: 1,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary.withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : null,
                        ),
                        child: Icon(
                          _categories[index]['icon'],
                          color: isSelected ? AppColors.white : AppColors.grey,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        _categories[index]['name'],
                        style: AppTextStyles.font12GreyRegular.copyWith(
                          fontSize: 12.sp,
                          color: isSelected ? AppColors.black : AppColors.grey,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
