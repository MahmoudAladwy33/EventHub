import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/di/dependency_injection.dart';
import 'package:flutter_project/Core/routing/app_router.dart';
import 'package:flutter_project/Core/theme/app_colors.dart';
import 'package:flutter_project/Features/events/logic/cubit/saved_events_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: BlocProvider(
        create: (context) => getIt<SavedEventsCubit>(),
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          title: 'My App',
          theme: ThemeData(
            primaryColor: AppColors.primary,
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.poppinsTextTheme(),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.primary,
              selectionColor: AppColors.primary.withOpacity(0.3),
              selectionHandleColor: AppColors.primary,
            ),
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
