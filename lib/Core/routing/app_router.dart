import 'package:flutter/material.dart';
import 'package:flutter_project/Features/auth/sign_in/ui/sign_in_screen.dart';
import 'package:flutter_project/Features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:flutter_project/Features/events/ui/views/event_details_view.dart';
import 'package:flutter_project/Features/events/ui/views/events_view.dart';
import 'package:flutter_project/Features/events/ui/views/search_view.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/ui/views/main_layout_view.dart';
import '../../Features/onBoarding/on_boarding_screen.dart';
import '../../Features/splash_view/splash_screen.dart';


abstract class AppRouter {
  static const kOnBoardingScreen = '/onboarding';
  static const kSignInScreen = '/signin';
  static const kSignUpScreen = '/signup';
  static const kEventDetailsScreen = '/eventDetails';
  static const kEventListScreen = '/eventList';
  static const kMainLayoutScreen = '/mainlayout';
  static const kSearchScreen = '/searchView';
  static const kUpComingEventsListScreen = '/upcomingEventsList';



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
      GoRoute(
        path: kEventDetailsScreen,
        builder: (context, state) {
          return const EventDetailsView();
        },
      ),

      GoRoute(
        path: kMainLayoutScreen ,
        builder: (context, state) => const MainLayoutView(),
      ),

      GoRoute(
        path: kEventListScreen ,
        builder: (context, state) => const EventsView(),
      ),
      GoRoute(
        path: kSearchScreen ,
        builder: (context, state) => const SearchView(),
      ),
      // GoRoute(
      //   path: kUpComingEventsListScreen ,
      //   builder: (context, state) => const (),
      // ),
    ],
  );
}
