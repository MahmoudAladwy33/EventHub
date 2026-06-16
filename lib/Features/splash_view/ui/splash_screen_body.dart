import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/di/dependency_injection.dart';
import '../../../Core/routing/app_router.dart';
import '../../../Core/utlils/app_images.dart';
import '../../auth/data/repos/auth_repository.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}



class _SplashScreenBodyState extends State<SplashScreenBody> {

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    
    if (!mounted) return;

    final prefs = getIt<SharedPreferences>();
    final hasSeenOnboarding = prefs.getBool('has_seen_onboarding') ?? false;

    if (!hasSeenOnboarding) {
      GoRouter.of(context).go(AppRouter.kOnBoardingScreen);
      return;
    }

    final authRepo = getIt<AuthRepository>();
    final isLoggedIn = await authRepo.isLoggedIn();

    if (isLoggedIn) {
      GoRouter.of(context).go(AppRouter.kMainLayoutScreen);
    } else {
      GoRouter.of(context).go(AppRouter.kSignInScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Image(
          image: AssetImage(AppImages.appLogo),
        ),
      ),
    );
  }
}