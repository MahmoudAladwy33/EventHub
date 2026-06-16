import 'package:flutter/material.dart';
import 'package:flutter_project/Features/home/ui/widgets/event_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsList extends StatelessWidget {
  final List<dynamic> events;

  const EventsList({
    super.key,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: EventCard(
            title: events[index].title,
            imagePath: events[index].image,
            date: events[index].date,
            month: events[index].month,
            location: events[index].address,
            attendees: events.length.toString(),
          ),
        );
      },
    );
  }
}