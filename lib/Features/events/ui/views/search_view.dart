import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Features/home/ui/widgets/event_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/di/dependency_injection.dart';
import '../../../../Core/theme/app_colors.dart';
import '../../../../Core/theme/app_text_styles.dart';
import '../../logic/cubit/search_cubit.dart';
import '../widgets/filter_sheet/filter_bottom_sheet.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewViewState();
}

class _SearchViewViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  late SearchCubit _searchCubit;

  @override
  void initState() {
    super.initState();
    _searchCubit = getIt<SearchCubit>()..loadInitial();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchCubit.close();
    super.dispose();
  }

  void _filterSearch(String query) {
    _searchCubit.keywordChanged(query);
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _searchCubit,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            onPressed: () => Navigator.maybePop(context),
            icon: Icon(Icons.arrow_back, color: AppColors.black, size: 26.sp),
          ),
          title: Text('Search', style: AppTextStyles.font18BlackBold.copyWith(fontSize: 22.sp)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              _buildSearchRow(context),
              SizedBox(height: 24.h),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state.status == SearchStatus.loading && state.events.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.events.isEmpty) {
                      return Center(
                        child: Text(
                          'No results found',
                          style: AppTextStyles.font12GreyRegular.copyWith(fontSize: 16.sp),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        final event = state.events[index];
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.search, color: AppColors.primary, size: 24.sp),
              SizedBox(width: 8.w),
              Container(width: 1.w, height: 20.h, color: AppColors.greyLight),
              SizedBox(width: 8.w),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterSearch,
                  style: AppTextStyles.font15BlackRegular.copyWith(fontSize: 16.sp),
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => BlocProvider.value(
                value: _searchCubit,
                child: const FilterBottomSheet(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10.r,
                  backgroundColor: AppColors.white.withValues(alpha: 0.15),
                  child: Icon(CupertinoIcons.slider_horizontal_3, color: AppColors.white, size: 12.sp),
                ),
                SizedBox(width: 6.w),
                Text(
                  'Filters',
                  style: AppTextStyles.font15WhiteRegular.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}