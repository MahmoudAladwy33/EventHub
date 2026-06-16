import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/home_cubit.dart';
import 'event_card.dart';

class NearbyEventsList extends StatelessWidget {
  const NearbyEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.nearbyEvents != current.nearbyEvents || previous.status != current.status,
      builder: (context, state) {
        if (state.status == HomeStatus.loading && state.nearbyEvents.isEmpty) {
          return const SizedBox(
            height: 270,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final events = state.nearbyEvents;

        if (events.isEmpty) {
          return const SizedBox(
            height: 270,
            child: Center(child: Text('No Nearby Events')),
          );
        }

        return SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return EventCard(
                id: event.id,
                title: event.title,
                imagePath: event.imageUrl,
                date: event.day,
                month: event.month,
                location: event.location,
                attendees: '+20 Going', // Using dummy attendees
              );
            },
          ),
        );
      },
    );
  }
}
