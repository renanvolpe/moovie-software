import 'package:flutter/material.dart';
import 'package:movie_software/styles/color/app_color.dart';

var lightSwitchTheme = SwitchThemeData(
  padding: EdgeInsets.all(20),
  thumbIcon: MaterialStateProperty.resolveWith<Icon>((states) {
    if (states.contains(MaterialState.selected)) {
      return Icon(Icons.sunny, color: AppColors.white, size: 26);
    }

    if (states.contains(MaterialState.disabled)) {
      return Icon(Icons.nightlight_round, color: AppColors.primary, size: 26);
    }
    return Icon(Icons.nightlight_round, color: AppColors.warning);
  }),
  thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.primary;
    }
    return AppColors.gray;
  }),
  trackColor: MaterialStateProperty.resolveWith<Color>((states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.backgroundLight;
    }
    return AppColors.grayLight;
  }),
  trackOutlineColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.primary; // border-like effect
    }
    return AppColors.grayLight;
  }),
  overlayColor: MaterialStateProperty.all(Colors.transparent),
);

var darkSwitchTheme = SwitchThemeData(
  thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.primary;
    }
    return AppColors.grayDark;
  }),
  trackColor: MaterialStateProperty.resolveWith<Color>((states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.primaryDark;
    }
    return AppColors.grayDark;
  }),
  overlayColor: MaterialStateProperty.all(Colors.transparent),
);
