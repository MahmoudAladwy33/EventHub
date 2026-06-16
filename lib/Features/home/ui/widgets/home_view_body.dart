import 'package:flutter/material.dart';

import '../widgets/categories_list.dart';
import '../widgets/home_header.dart';
import '../widgets/invite_banner.dart';
import '../widgets/section_title.dart';
import '../widgets/upcoming_events_list.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            SizedBox(height: 16),
            CategoriesList(),
            SizedBox(height: 24),
            SectionTitle(title: 'Upcoming Events'),
            SizedBox(height: 16),
            UpcomingEventsList(),
            SizedBox(height: 24),
            InviteBanner(),
            SizedBox(height: 24),
            SectionTitle(title: 'Nearby You'),
            SizedBox(height: 16),
            SizedBox(
              height: 100, 
              child: Center(child: Text('Nearby Events List')),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
