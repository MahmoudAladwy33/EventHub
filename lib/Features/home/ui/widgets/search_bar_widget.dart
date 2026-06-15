import 'package:flutter/material.dart';

import '../../../../Core/theme/app_colors.dart';


class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: const TextStyle(color: AppColors.white),
            decoration: InputDecoration(
              hintText: '| Search...',
              hintStyle: TextStyle(
                color: AppColors.white.withAlpha((255 * 0.5).toInt()),
                fontSize: 18,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.white,
                size: 28,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
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
    );
  }
}
