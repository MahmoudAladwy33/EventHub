import 'package:flutter/material.dart';
import 'app_colors.dart';
class AppFontWeight {
  const AppFontWeight._();

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}
class AirbnbCerealTextStyle extends TextStyle {
  const AirbnbCerealTextStyle({
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.color,
    super.letterSpacing,
    super.height,
    super.decoration,
  }) : super(fontFamily: 'AirbnbCereal');
}

class AppTextStyles {
  const AppTextStyles._();

  static const TextStyle font22WhiteMedium = AirbnbCerealTextStyle(
      fontSize: 22,
      color: AppColors.white,
      fontWeight:  AppFontWeight.medium


  );
  static const TextStyle font16BlackMedium = AirbnbCerealTextStyle(
      fontSize: 16,
      color: AppColors.black,
      fontWeight: AppFontWeight.medium

  );
  static const TextStyle font14GreyMedium = AirbnbCerealTextStyle(
      fontSize: 14,
      color: AppColors.grey,
      fontWeight: AppFontWeight.medium


  );

  static const TextStyle font18WhiteMedium = AirbnbCerealTextStyle(
      fontSize: 18,
      color: AppColors.white,
      fontWeight:  AppFontWeight.medium


  );

  static const TextStyle font15WhiteRegular = AirbnbCerealTextStyle(
      fontSize: 15,
      color: AppColors.onboardingSubText,
      fontWeight: AppFontWeight.regular


  );

  static const TextStyle font15BlackRegular = AirbnbCerealTextStyle(
      fontSize: 15,
      color: AppColors.black,
      fontWeight:  AppFontWeight.regular

  );

  static const TextStyle font18BlackBold = AirbnbCerealTextStyle(
      fontSize: 18,
      color: AppColors.black,
      fontWeight: AppFontWeight.bold
  );

  static const TextStyle font14PrimaryMedium = AirbnbCerealTextStyle(
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: AppFontWeight.medium
    ,
  );

  static const TextStyle font12GreyRegular = AirbnbCerealTextStyle(
      fontSize: 12,
      color: AppColors.grey,
      fontWeight:AppFontWeight.regular
  );


  static const TextStyle font16BlackSemiBold = AirbnbCerealTextStyle(
      fontSize: 16,
      color: AppColors.black,
      fontWeight: AppFontWeight.semiBold
  );

  static const TextStyle font14PrimaryRegular = AirbnbCerealTextStyle(
      fontSize: 14,
      color: AppColors.primary,
      fontWeight:AppFontWeight.regular
  );
}