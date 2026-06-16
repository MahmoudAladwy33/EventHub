
import 'package:flutter/material.dart';
import 'package:flutter_project/Features/profile/widgets/profile_tab.dart';
import 'package:flutter_project/Features/profile/widgets/reviews_tab_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/theme/app_colors.dart';
import 'about_tab_content.dart';
import 'events_tab_content.dart';

class ProfileTabSection extends StatefulWidget {
  final ProfileTab initialTab;

  const ProfileTabSection({
    super.key,
    this.initialTab = ProfileTab.about,
  });

  @override
  State<ProfileTabSection> createState() => _ProfileTabSectionState();
}

class _ProfileTabSectionState extends State<ProfileTabSection> {
  late ProfileTab _activeTab;

  @override
  void initState() {
    super.initState();
    _activeTab = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Container(
          color: AppColors.greyBackground,
          child: _buildTabContent(),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTabItem(ProfileTab.about, "aboutTab"),
            _buildTabItem(ProfileTab.event, "eventTab"),
            _buildTabItem(ProfileTab.reviews,"reviewsTab"),
          ],
        ),
        Container(
          width: double.infinity,
          height: 1.h,
          color: AppColors.greyLight,
        ),
      ],
    );
  }

  Widget _buildTabItem(ProfileTab tab, String label) {
    final isSelected = _activeTab == tab;
    return InkWell(
      onTap: () {
        setState(() {
          _activeTab = tab;
        });
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColors.primary : AppColors.grey,
              ),
            ),
          ),
          if (isSelected)
            Container(
              width: 60.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.r),
                  topRight: Radius.circular(3.r),
                ),
              ),
            )
          else
            SizedBox(height: 3.h),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_activeTab) {
      case ProfileTab.about:
        return const AboutTabContent();
      case ProfileTab.event:
        return const EventsTabContent();
      case ProfileTab.reviews:
        return const ReviewsTabContent();
    }
  }
}