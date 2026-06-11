import 'package:flutter/material.dart';
import 'package:flutter_project/Core/routing/app_router.dart';
import 'package:flutter_project/Core/theme/colors_manager.dart';
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
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'My App',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: ColorsManager.mainBlue,
            selectionColor: ColorsManager.mainBlue.withOpacity(0.3),
            selectionHandleColor: ColorsManager.mainBlue,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
