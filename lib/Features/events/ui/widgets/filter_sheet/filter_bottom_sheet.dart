
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/theme/app_colors.dart';
import '../../../../../Core/theme/app_text_styles.dart';
import '../../../data/entities/event_query.dart';
import '../../../logic/cubit/search_cubit.dart';
import 'filter_categories_row.dart';
import 'filter_location_section.dart';
import 'filter_price_slider.dart';
import 'filter_time_date_section.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String _selectedCategory = 'Sports';
  int _selectedDateChip = 1; // 0: Today, 1: Tomorrow, 2: This week
  RangeValues _priceRange = const RangeValues(20, 120);

  EventDatePreset _getPreset() {
    switch (_selectedDateChip) {
      case 0:
        return EventDatePreset.today;
      case 2:
        return EventDatePreset.thisWeek;
      case 1:
      default:
        return EventDatePreset.tomorrow;
    }
  }

  void _applyFilters() {
    context.read<SearchCubit>().applyFilters(
      classificationName: _selectedCategory,
      datePreset: _getPreset(),
      customDate: null, // Since we don't implement full calendar yet
      minPrice: _priceRange.start,
      maxPrice: _priceRange.end,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(38.r),
          topRight: Radius.circular(38.r),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 50.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.greyLight,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Filter',
              style: AppTextStyles.font18BlackBold.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            FilterCategoriesRow(
              selectedCategory: _selectedCategory,
              onCategoryChanged: (cat) => setState(() => _selectedCategory = cat),
            ),
            SizedBox(height: 20.h),
            FilterTimeDateSection(
              selectedChip: _selectedDateChip,
              onChipChanged: (index) => setState(() => _selectedDateChip = index),
            ),
            SizedBox(height: 20.h),
            const FilterLocationSection(),
            SizedBox(height: 20.h),
            FilterPriceSlider(
              currentRangeValues: _priceRange,
              onChanged: (values) => setState(() => _priceRange = values),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'Sports';
                        _selectedDateChip = 1;
                        _priceRange = const RangeValues(20, 120);
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.greyLight),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                    ),
                    child: Text(
                      'RESET',
                      style: AppTextStyles.font16BlackSemiBold.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _applyFilters,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      elevation: 0,
                    ),
                    child: Text(
                      'APPLY',
                      style: AppTextStyles.font16BlackSemiBold.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
