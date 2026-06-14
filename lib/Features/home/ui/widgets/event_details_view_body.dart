
import 'package:flutter/material.dart';
import 'package:flutter_project/Core/theme/app_colors.dart';
import 'package:flutter_project/Core/utlils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Wodgets/custom_button.dart';
import '../../../../Core/theme/app_text_styles.dart';
import 'attendees_row.dart';
import 'info_row.dart';
import 'organizer_row.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              clipBehavior: Clip.none,
              expandedHeight: 220.h,
              pinned: true,
              backgroundColor: AppColors.white,

              bottom: PreferredSize(
                preferredSize: Size.fromHeight(56.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Transform.translate(
                    offset: Offset(0, 28.h),
                    child: const AttendeesRow(),
                  ),
                ),
              ),

              leading: GestureDetector(
                onTap: () => Navigator.of(context).maybePop(),
                child: Container(
                  margin: EdgeInsets.all(8.r),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ),

              title: Text(
               "eventDetails",
                style: AppTextStyles.font18WhiteMedium.copyWith(
                  fontSize: 18.sp,
                ),
              ),

              actions: [
                Container(
                  margin: EdgeInsets.only(right: 16.w, top: 8.h, bottom: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.bookmark_border,
                      color: AppColors.white,
                      size: 20.sp,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],

              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                     AppImages.eventDetails,
                      fit: BoxFit.cover,
                    ),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 120.h,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              AppColors.black.withValues(alpha: 0.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 46.h),
                    Text(
                      'International Band\nMusic Concert',
                      style: AppTextStyles.font18BlackBold.copyWith(
                        fontSize: 34.sp,
                        height: 1.2,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    InfoRow(
                      iconData: Icons.calendar_month_outlined,
                      iconBgColor: AppColors.primary.withValues(alpha: 0.12),
                      iconColor: AppColors.primary,
                      title: '14 December, 2021',
                      subtitle: 'Tuesday, 4:00PM - 9:00PM',
                    ),

                    SizedBox(height: 16.h),

                    InfoRow(
                      iconData: Icons.location_on_outlined,
                      iconBgColor: AppColors.primary.withValues(alpha: 0.12),
                      iconColor: AppColors.primary,
                      title: 'Gala Convention Center',
                      subtitle: '36 Guild Street London, UK',
                    ),

                    SizedBox(height: 16.h),

                    const OrganizerRow(),

                    SizedBox(height: 24.h),

                    Text(
                      'About Event',
                      style: AppTextStyles.font16BlackSemiBold.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Text(
                      'Enjoy your favorite dishes and spend a lovely time with your '
                          'friends and family and have a great time. Food from local food '
                          'trucks will be available for purchase.'
                          'Enjoy your favorite dishes and spend a lovely time with your '
                          'friends and family and have a great time. Food from local food '
                          'trucks will be available for purchase.'
                          'Enjoy your favorite dishes and spend a lovely time with your '
                          'friends and family and have a great time. Food from local food '
                          'trucks will be available for purchase.'
                          'Enjoy your favorite dishes and spend a lovely time with your '
                          'friends and family and have a great time. Food from local food '
                          'trucks will be available for purchase.'
                      ,
                      style: AppTextStyles.font15BlackRegular.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.greyDark,
                        height: 1.6,
                      ),
                    ),

                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
          ],
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 28.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.06),
                  blurRadius: 16,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: CustomButton(text: 'Buy Ticket \$120', onPressed: () {}),
          ),
        ),
      ],
    );
  }
}