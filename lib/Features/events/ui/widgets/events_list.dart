import 'package:flutter/material.dart';
import 'package:flutter_project/Features/home/ui/widgets/event_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/entities/event_entity.dart';

class EventsList extends StatelessWidget {
  final List<EventEntity> events;

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
        final event = events[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: EventCard(
            id: event.id,
            title: event.title,
            imagePath: event.imageUrl,
            date: event.dateTime.day.toString(),
            month: _getMonthAbbreviation(event.dateTime.month),
            location: event.address,
            attendees: '+20 Going',
          ),
        );
      },
    );
  }

  String _getMonthAbbreviation(int month) {
    const months = [
      '', 'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
    ];
    if (month >= 1 && month <= 12) {
      return months[month];
    }
    return '';
  }
}