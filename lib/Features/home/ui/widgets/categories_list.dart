import 'package:flutter/material.dart';
import '../../../../Core/theme/app_colors.dart';
import 'category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'title': 'Sports',
        'icon': Icons.sports_basketball,
        'color': AppColors.redSports,
      },
      {
        'title': 'Music',
        'icon': Icons.music_note,
        'color': AppColors.orangeMusic,
      },
      {
        'title': 'Food',
        'icon': Icons.restaurant,
        'color': AppColors.greenFood,
      },
      {
        'title': 'Art',
        'icon': Icons.palette,
        'color': AppColors.cyanArt,
      },
    ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            title: category['title'] as String,
            icon: category['icon'] as IconData,
            color: category['color'] as Color,
          );
        },
      ),
    );
  }
}
