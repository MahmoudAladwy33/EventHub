import 'package:flutter/material.dart';
import 'package:flutter_project/Features/auth/sign_in/ui/sign_in_screen.dart';
import 'package:flutter_project/Features/auth/sign_up/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

import '../../Features/onBoarding/on_boarding_screen.dart';
import '../../Features/splash_view/splash_screen.dart';


abstract class AppRouter {
  static const kOnBoardingScreen = '/onboarding';
  static const kSignInScreen = '/signin';
  static const kSignUpScreen = '/signup';
  

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) {
          return const OnBoardingScreen();
        },
       ),
      GoRoute(
        path: kSignInScreen,
        builder: (context, state) {
           return const SignInScreen();
        },
      ),
    
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) {
        return const SignUpScreen();
        },
      ),

     
    ],
  );
}
