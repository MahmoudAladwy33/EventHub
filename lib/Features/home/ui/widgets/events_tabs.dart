
import 'package:flutter/material.dart';
import 'package:flutter_project/Features/home/ui/widgets/tab_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/events_view.dart';

class EventsTabs extends StatelessWidget {
  const EventsTabs({
    super.key,
    required this.selectedTab,
    required this.onChanged,
  });

  final EventsTab selectedTab;
  final ValueChanged<EventsTab> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TabItem(
              title: "upcoming",
              isSelected: selectedTab == EventsTab.upcoming,
              onTap: () => onChanged(EventsTab.upcoming),
            ),
          ),
          Expanded(
            child: TabItem(
              title: "pastEvents",
              isSelected: selectedTab == EventsTab.past,
              onTap: () => onChanged(EventsTab.past),
            ),
          ),
        ],
      ),
    );
  }
}