import 'package:flutter/material.dart';
import 'package:flutter_project/Core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/theme/app_colors.dart';
import '../../../../Core/theme/app_text_styles.dart';


class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.font18SemiBold.withColor(AppColors.black),
          ),
          GestureDetector(
            onTap: (){
              GoRouter.of(context).push(AppRouter.kEventListScreen);
            },
            child: Row(
              children: [
                Text(
                  'See All',
                  style: AppTextStyles.font14Regular.withColor(AppColors.darkGray),
                ),
                const Icon(
                  Icons.arrow_right,
                  color: AppColors.darkGray,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
