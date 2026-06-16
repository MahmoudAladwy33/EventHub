import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/theme/app_colors.dart';
import '../../logic/cubit/home_cubit.dart';
import 'category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultStyles = [
      {'icon': Icons.sports_basketball, 'color': AppColors.redSports},
      {'icon': Icons.music_note, 'color': AppColors.orangeMusic},
      {'icon': Icons.restaurant, 'color': AppColors.greenFood},
      {'icon': Icons.palette, 'color': AppColors.cyanArt},
    ];

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.categories != current.categories || previous.status != current.status,
      builder: (context, state) {
        if (state.status == HomeStatus.loading && state.categories.isEmpty) {
          return const SizedBox(
            height: 40,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final categories = state.categories;

        return SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final style = defaultStyles[index % defaultStyles.length];
              return CategoryItem(
                title: category.name,
                icon: style['icon'] as IconData,
                color: style['color'] as Color,
              );
            },
          ),
        );
      },
    );
  }
}
