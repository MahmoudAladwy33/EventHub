
import 'package:flutter/material.dart';
import 'package:flutter_project/Core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/theme/app_colors.dart';
import '../../../../Core/theme/app_text_styles.dart';

class EventAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EventAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        onPressed: () => GoRouter.of(context).push(AppRouter.kMainLayoutScreen),
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.black,
          size: 28.sp,
        ),
      ),
      title: Text(
      "events",
        style: AppTextStyles.font18BlackBold.copyWith(
          fontSize: 32.sp,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: AppColors.black,
            size: 28.sp,
          ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}