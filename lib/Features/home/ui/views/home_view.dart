import 'package:flutter/material.dart';
import '../../../../Core/di/dependency_injection.dart';
import '../../../../Core/theme/app_colors.dart';
import '../../logic/cubit/home_cubit.dart';
import '../widgets/home_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      body: BlocProvider(
        create: (context) => getIt<HomeCubit>()..load(),
        child: const HomeViewBody(),
      ),
    );
  }
}