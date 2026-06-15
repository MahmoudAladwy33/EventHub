import 'package:flutter/material.dart';
import '../../../../Core/theme/app_colors.dart';
import '../../../../Core/theme/app_text_styles.dart';
import 'search_bar_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 20,
        right: 20,
        bottom: 24,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.menu,
                color: AppColors.white,
                size: 28,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Current Location',
                        style: TextStyle(
                          color: AppColors.white.withAlpha((255 * 0.7).toInt()),
                          fontSize: 12,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  Text(
                    'New York, USA',
                    style: AppTextStyles.font16Medium.withColor(AppColors.white),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white.withAlpha((255 * 0.1).toInt()),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SearchBarWidget(),
        ],
      ),
    );
  }
}
