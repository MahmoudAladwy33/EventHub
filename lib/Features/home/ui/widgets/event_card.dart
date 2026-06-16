import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/utlils/app_images.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/routing/app_router.dart';
import '../../../../Core/theme/app_colors.dart';
import '../../../../Core/theme/app_text_styles.dart';
import '../../../events/data/entities/saved_event_model.dart' as flutter_project;
import '../../../events/logic/cubit/saved_events_cubit.dart' as flutter_project;
import '../../../events/logic/cubit/saved_events_state.dart' as flutter_project;

class EventCard extends StatelessWidget {
  final String id;
  final String title;
  final String imagePath;
  final String date;
  final String month;
  final String location;
  final String attendees;

  const EventCard({
    super.key,
    required this.id,
    required this.title,
    required this.imagePath,
    required this.date,
    required this.month,
    required this.location,
    required this.attendees,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('${AppRouter.kEventDetailsScreen}/$id');
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray.withAlpha((255 * 0.5).toInt()),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: imagePath.startsWith('http')
                    ? Image.network(
                        imagePath,
                        height: 130,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 130,
                          width: double.infinity,
                          color: AppColors.primaryColorShade100,
                          child: const Center(child: Icon(Icons.image, size: 50, color: AppColors.primaryColorShade300)),
                        ),
                      )
                    : Image.asset(
                        imagePath,
                        height: 130,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 130,
                          width: double.infinity,
                          color: AppColors.primaryColorShade100,
                          child: const Center(child: Icon(Icons.image, size: 50, color: AppColors.primaryColorShade300)),
                        ),
                      ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.white.withAlpha((255 * 0.9).toInt()),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          date,
                          style: AppTextStyles.font18SemiBold.withColor(AppColors.redSports),
                        ),
                        Text(
                          month,
                          style: AppTextStyles.font10Regular.withColor(AppColors.redSports).copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: BlocBuilder<flutter_project.SavedEventsCubit, flutter_project.SavedEventsState>(
                    builder: (context, state) {
                      final isSaved = context.read<flutter_project.SavedEventsCubit>().isEventSaved(id);
                      return GestureDetector(
                        onTap: () {
                          context.read<flutter_project.SavedEventsCubit>().toggleSavedEvent(
                            flutter_project.SavedEventModel(
                              id: id,
                              title: title,
                              imagePath: imagePath,
                              date: date,
                              month: month,
                              location: location,
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.white.withAlpha((255 * 0.9).toInt()),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: AppColors.redSports,
                            size: 20,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: AppTextStyles.font18SemiBold.withColor(AppColors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 24,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(AppImages.womanAvatar),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(AppImages.manAvatar),
                        ),
                      ),
                      Positioned(
                        left: 32,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(AppImages.womanAvatar),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  attendees,
                  style: AppTextStyles.font12Regular.withColor(AppColors.primaryColor).copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.darkGray,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    location,
                    style: AppTextStyles.font12Regular.withColor(AppColors.darkGray),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
