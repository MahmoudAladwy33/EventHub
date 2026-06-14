
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Wodgets/custom_button.dart';
import '../../../../Core/theme/app_colors.dart';
import '../../../../Core/theme/app_text_styles.dart';
import '../../../../Core/utlils/app_images.dart';

class EmptyEventsView extends StatelessWidget {
  const EmptyEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 80.h),

            Image.asset(
            AppImages.noUpcomingEvent,
              width: 220.w,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 32.h),

            Text(
             "noUpcomingEvent",
              textAlign: TextAlign.center,
              style: AppTextStyles.font18BlackBold.copyWith(
                fontSize: 24.sp,
              ),
            ),

            SizedBox(height: 16.h),

            Text(
             "noUpcomingEventDescription",
              textAlign: TextAlign.center,
              style: AppTextStyles.font15BlackRegular.copyWith(
                color: AppColors.greyDark,
                fontSize: 16.sp,
                height: 1.6,
              ),
            ),

            Spacer(),

            CustomButton(
              text: "exploreEvents",
              onPressed: () {},
            ),
            SizedBox(height: 33.h),
          ],
        ),
      ),
    );
  }
}