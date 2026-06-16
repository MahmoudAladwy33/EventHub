import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Features/home/ui/widgets/event_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../events/logic/cubit/saved_events_cubit.dart';
import '../../events/logic/cubit/saved_events_state.dart';

class EventsTabContent extends StatelessWidget {
  const EventsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedEventsCubit, SavedEventsState>(
      builder: (context, state) {
        if (state is SavedEventsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SavedEventsLoaded) {
          final events = state.savedEvents;
          
          if (events.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(24.w),
                child: const Text('No saved events yet.'),
              ),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(24.w),
            itemCount: events.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 12.h),
                child: EventCard(
                    id: events[index].id,
                    title: events[index].title,
                    imagePath: events[index].imagePath,
                    date: events[index].date,
                    month: events[index].month,
                    location: events[index].location,
                    attendees: '+20 Going'), // Dummy attendees
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}