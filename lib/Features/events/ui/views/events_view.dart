import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/di/dependency_injection.dart';
import '../../../../Core/theme/app_colors.dart';
import '../../data/entities/event_query.dart';
import '../../logic/cubit/events_list_cubit.dart';
import '../widgets/empty_events_view.dart';
import '../widgets/event_app_bar.dart';
import '../widgets/events_list.dart';
import '../widgets/events_tabs.dart';

enum EventsTab {
  upcoming,
  past,
}

class EventsView extends StatefulWidget {
  const EventsView({super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  EventsTab selectedTab = EventsTab.upcoming;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EventsListCubit>(param1: EventListMode.upcoming)..load(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: EventAppBar(),
            body: Column(
              children: [
                SizedBox(height: 12.h),
                EventsTabs(
                  selectedTab: selectedTab,
                  onChanged: (tab) {
                    setState(() {
                      selectedTab = tab;
                    });
                    final mode = tab == EventsTab.upcoming ? EventListMode.upcoming : EventListMode.past;
                    context.read<EventsListCubit>().changeMode(mode);
                  },
                ),
                SizedBox(height: 24.h),
                Expanded(
                  child: BlocBuilder<EventsListCubit, EventsListState>(
                    builder: (context, state) {
                      if (state.status == ListStatus.loading && state.events.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state.events.isEmpty) {
                        return const EmptyEventsView();
                      }

                      return EventsList(events: state.events);
                    },
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}