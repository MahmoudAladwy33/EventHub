
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/theme/app_colors.dart';
import '../../../../Core/theme/app_text_styles.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black.withValues(alpha: .06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ]
              : null,
        ),
        child: Text(
          title,
          style: AppTextStyles.font16BlackMedium.copyWith(
            color: isSelected
                ? AppColors.primary
                : const Color(0xFF9E9E9E),
          ),
        ),
      ),
    );
  }
}