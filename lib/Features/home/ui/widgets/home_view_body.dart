import 'package:flutter/material.dart';

import 'categories_list.dart';
import 'home_header.dart';
import 'invite_banner.dart';
import 'section_title.dart';
import 'upcoming_events_list.dart';
import 'nearby_events_list.dart';


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
            NearbyEventsList(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
