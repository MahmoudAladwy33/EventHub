
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/theme/app_colors.dart';
import '../../../../../Core/theme/app_text_styles.dart';

class FilterPriceSlider extends StatelessWidget {
  final RangeValues currentRangeValues;
  final ValueChanged<RangeValues> onChanged;

  const FilterPriceSlider({
    super.key,
    required this.currentRangeValues,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Select price range',
              style: AppTextStyles.font16BlackSemiBold.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$${currentRangeValues.start.round()}-\$${currentRangeValues.end.round()}',
              style: AppTextStyles.font14PrimaryMedium.copyWith(
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        // Histogram / bar chart decoration
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: _buildHistogram(),
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.greyLight,
            thumbColor: AppColors.primary,
            trackHeight: 2,
            rangeThumbShape: const RoundRangeSliderThumbShape(
              enabledThumbRadius: 10,
            ),
          ),
          child: RangeSlider(
            values: currentRangeValues,
            min: 0,
            max: 200,
            divisions: 20,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildHistogram() {
    final heights = [10, 16, 25, 12, 18, 8, 14, 22, 30, 20, 12, 24, 18, 10, 14, 20, 28, 16, 12];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: heights.map((h) {
        return Container(
          width: 8.w,
          height: h.h,
          decoration: BoxDecoration(
            color: AppColors.greyLight.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(2.r),
          ),
        );
      }).toList(),
    );
  }
}
