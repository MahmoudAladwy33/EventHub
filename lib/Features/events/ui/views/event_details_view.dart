import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/di/dependency_injection.dart';
import '../../logic/cubit/event_details_cubit.dart';
import '../widgets/event_details_view_body.dart';

class EventDetailsView extends StatelessWidget {
  final String eventId;

  const EventDetailsView({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EventDetailsCubit>()..load(eventId),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: EventDetailsViewBody(),
      ),
    );
  }
}