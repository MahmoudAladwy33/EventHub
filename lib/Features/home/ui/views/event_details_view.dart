import 'package:flutter/material.dart';
import '../widgets/event_details_view_body.dart';




class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: EventDetailsViewBody(),
    );
  }
}