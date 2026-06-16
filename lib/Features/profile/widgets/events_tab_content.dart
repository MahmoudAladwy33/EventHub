
import 'package:flutter/material.dart';
import 'package:flutter_project/Features/home/ui/widgets/event_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/utlils/app_images.dart';
import '../../events/data/event_mock_data.dart';

class EventsTabContent extends StatelessWidget {
  const EventsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EventMockData> events = [
      EventMockData(
        title: 'A virtual evening of smooth jazz',
        image: AppImages.eventDetails,
        date: '1',
        month: 'MAY',
        address: 'Central Park, New York',
        time: '1st May- Sat -2:00 PM',
      ),
      EventMockData(
        title: "Jo malone london's mother's day",
        image: AppImages.eventDetails,
        date: '1',
        month: 'MAY',
        address: 'Radius Gallery London, UK',
        time: '1st May- Sat -2:00 PM',
      ),
      EventMockData(
        title: 'Women\'s leadership conference',
        image: AppImages.eventDetails,
        date: '1',
        month: 'MAY',
        address: 'Convention Center New York, USA',
        time: '1st May- Sat -2:00 PM',
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(24.w),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          child: EventCard(
              title: events[index].title ,
              imagePath: events[index].image,
              date: events[index].date,
              month: events[index].month,
              location: events[index].address,
              attendees: events.length.toString())
        );
      },
    );
  }
}