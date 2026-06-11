import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Features/splash_view/splash_screen.dart';


abstract class AppRouter {
  static const kOnBoardingScreen = '/onboarding';
  static const kLoginScreen = '/login';
  static const kSignUpScreen = '/signup';
  

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      // GoRoute(
      //   path: kOnBoardingScreen,
      //   builder: (context, state) {
      //     return const OnBoardingScreen();
      //   },
      // ),
      // GoRoute(
      //   path: kLoginScreen,
      //   builder: (context, state) {
      //      return const LoginScreen();
      //   },
      // ),
    
      // GoRoute(
      //   path: kSignUpScreen,
      //   builder: (context, state) {
        
         
      //   return const SignUpScreen();
      //   },
      // ),

     
    ],
  );
}
