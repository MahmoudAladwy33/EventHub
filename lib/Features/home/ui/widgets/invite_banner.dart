import 'package:flutter/material.dart';

import '../../../../Core/theme/app_colors.dart';
import '../../../../Core/theme/app_text_styles.dart';


class InviteBanner extends StatelessWidget {
  const InviteBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightCyanBanner,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Invite your friends',
                  style: AppTextStyles.font18SemiBold.withColor(AppColors.black),
                ),
                const SizedBox(height: 4),
                Text(
                  'Get \$20 for ticket',
                  style: AppTextStyles.font14Regular.withColor(AppColors.darkGray),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.cyanBanner,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    elevation: 0,
                  ),
                  child: const Text(
                    'INVITE',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Placeholder for the illustration
          Container(
            width: 100,
            height: 100,
            color: Colors.transparent,
            child: const Center(
              child: Icon(
                Icons.card_giftcard,
                size: 60,
                color: AppColors.orangeMusic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
