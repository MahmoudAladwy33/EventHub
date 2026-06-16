
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/theme/app_colors.dart';
import '../../../Core/theme/app_text_styles.dart';

class ReviewData {
  final String userName;
  final String avatar;
  final int rating;
  final String date;
  final String comment;

  ReviewData({
    required this.userName,
    required this.avatar,
    required this.rating,
    required this.date,
    required this.comment,
  });
}

class ReviewsTabContent extends StatelessWidget {
  const ReviewsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ReviewData> reviews = [
      ReviewData(
        userName: 'Rocks Velkeinjen',
        avatar: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=100',
        rating: 4,
        date: '10 Feb',
        comment: "reviewDefaultText",
      ),
      ReviewData(
        userName: 'Angelina Zolly',
        avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=100',
        rating: 4,
        date: '10 Feb',
        comment: "reviewDefaultText",
      ),
      ReviewData(
        userName: 'Zenifero Bolex',
        avatar: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=100',
        rating: 4,
        date: '10 Feb',
        comment: "reviewDefaultText",
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      imageUrl: review.avatar,
                      width: 32.r,
                      height: 32.r,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(color: AppColors.greyLight),
                      errorWidget: (context, url, error) => const Icon(Icons.person),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              review.userName,
                              style: AppTextStyles.font16BlackSemiBold.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              review.date,
                              style: AppTextStyles.font12GreyRegular.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: List.generate(5, (starIdx) {
                            return Icon(
                              starIdx < review.rating ? Icons.star : Icons.star_border,
                              color: const Color(0xFFFFC107),
                              size: 14.sp,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.only(left: 44.w),
                child: Text(
                  review.comment,
                  style: AppTextStyles.font15BlackRegular.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.greyDark,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}