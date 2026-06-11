import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Core/routing/app_router.dart';
import '../../../Core/utlils/app_images.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}



class _SplashScreenBodyState extends State<SplashScreenBody> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.kOnBoardingScreen);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Image(
          image: AssetImage(AppImages.splashViewImage),
        ),
      ),
    );
  }
}