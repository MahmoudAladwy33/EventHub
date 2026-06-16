import 'package:flutter/material.dart';
import 'package:flutter_project/Core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/theme/app_colors.dart';


class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      GoRouter.of(context).push(AppRouter.kSearchScreen);
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Search events',
              style: TextStyle(
                color: AppColors.white.withAlpha((255 * 0.5).toInt()),
                fontSize: 14,
              ),
            )
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.white.withAlpha((255 * 0.1).toInt()),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.filter_list,
                  color: AppColors.white,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  'Filters',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
