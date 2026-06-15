import 'package:flutter/material.dart';
import 'package:flutter_project/Core/utlils/app_images.dart';
import 'event_card.dart';

class UpcomingEventsList extends StatelessWidget {
  const UpcomingEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
      {
        'title': 'International Band Mu...',
        'imagePath': AppImages.eventDetails,
        'date': '10',
        'month': 'JUNE',
        'location': '36 Guild Street London, UK',
        'attendees': '+20 Going',
      },
      {
        'title': 'Jo Malone London',
        'imagePath': AppImages.eventDetails,
        'date': '10',
        'month': 'JUNE',
        'location': 'Radius Gallery, Santa Cruz',
        'attendees': '+20 Going',
      },
    ];

    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return EventCard(
            title: event['title']!,
            imagePath: event['imagePath']!,
            date: event['date']!,
            month: event['month']!,
            location: event['location']!,
            attendees: event['attendees']!,
          );
        },
      ),
    );
  }
}
