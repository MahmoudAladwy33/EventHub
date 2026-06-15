import 'package:flutter/material.dart';
import 'package:flutter_project/Features/events/ui/views/events_view.dart';
import '../../../../Core/theme/app_colors.dart';
import 'home_view.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    const HomeView(),
   EventsView(),
    const Center(child: Text('Map View Placeholder')),
    const Center(child: Text('Profile View Placeholder')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _views,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.explore_outlined,
                activeIcon: Icons.explore,
                label: 'Explore',
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.calendar_today_outlined,
                activeIcon: Icons.calendar_today,
                label: 'Events',
                index: 1,
              ),
              const SizedBox(width: 48.0),
              _buildNavItem(
                icon: Icons.map_outlined,
                activeIcon: Icons.map,
                label: 'Map',
                index: 2,
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: 'Profile',
                index: 3,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        elevation: 4.0,
        child: const Icon(
          Icons.add_box_outlined,
          color: AppColors.white,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: isSelected ? AppColors.primaryColor : AppColors.darkGray,
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.0,
              color: isSelected ? AppColors.primaryColor : AppColors.darkGray,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
