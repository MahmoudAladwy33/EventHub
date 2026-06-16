
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/theme/app_colors.dart';
import '../../../Core/theme/app_text_styles.dart';
import '../widgets/profile_stats_row.dart';
import '../widgets/profile_tab.dart';
import '../widgets/profile_tab_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "profile",
          style: AppTextStyles.font18BlackBold.copyWith(
            fontSize: 20.sp,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.black),
            onPressed: () {},
          ),
        ],
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Center(
                    child: Container(
                      width: 96.r,
                      height: 96.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(48.r),
                        child: CachedNetworkImage(
                          imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(color: AppColors.greyLight),
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.greyLight,
                            child: Icon(Icons.person, color: AppColors.grey, size: 40.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Name
                  Text(
                    'Ashfak Sayem',
                    style: AppTextStyles.font18BlackBold.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const ProfileStatsRow(
                    followingCount: '350',
                    followersCount: '346',
                  ),
                  SizedBox(height: 24.h),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.edit_note_outlined,
                          color: AppColors.primary,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "editProfile",
                          style: AppTextStyles.font14PrimaryMedium.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),

            // Reusable Tab Section
            const ProfileTabSection(
              initialTab: ProfileTab.about,
            ),
          ],
        ),
      ),
    );
  }
}