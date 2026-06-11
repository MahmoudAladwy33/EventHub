import 'package:flutter/material.dart';
import 'package:flutter_project/Features/onBoarding/ui/on_boarding_screen_temp.dart';
import 'package:go_router/go_router.dart';
import '../../../Core/routing/app_router.dart';
import '../../../Core/theme/colors_manager.dart';
import '../../../Core/utlils/app_images.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'img': AppImages.onBoardingFirstScreen,
      'title': 'Explore Upcoming and\nNearby Events',
      'desc': 'Discover events happening around you and plan your schedule effortlessly.',
    },
    {
      'img': AppImages.onBoardingSecondScreen,
      'title': ' Web Have Modern Events\nCalendar Feature',
      'desc': ' In publishing and graphic design, Lorem is a placeholder text commonly.',
    },
    {
      'img': AppImages.onBoardingThirdScreen,
      'title': 'To Look Up More Events or\nActivities Nearby By Map',
      'desc': ' In publishing and graphic design, Lorem is a placeholder text commonly.',
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      GoRouter.of(context).push(AppRouter.kSignInScreen);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) => OnBoardingScreenTemp(
                  onBoardingImg: _pages[index]['img']!,
                  title: _pages[index]['title']!,
                  description: _pages[index]['desc']!,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kSignInScreen);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                      ),
                    ),
                  ),


                  Row(
                    children: List.generate(
                      _pages.length,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ?  ColorsManager.mainBlue
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),


                  TextButton(
                    onPressed: _nextPage,
                    child: Text(
                      _currentPage == _pages.length - 1 ? 'Start' : 'Next',
                      style: const TextStyle(
                        color: ColorsManager.mainBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}