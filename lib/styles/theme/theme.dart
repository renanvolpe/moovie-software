import 'package:flutter/material.dart';

import '../color/color_scheme.dart';
import 'filled_btn_custom.dart';
import 'outlined_btn_custom.dart';
import 'textfied_decoration.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Lato',
      colorScheme: colorSchemeLight,
      filledButtonTheme: btnFilledThemeLight,
      outlinedButtonTheme: btnOutlinedThemeLight,
      inputDecorationTheme: inputDecorationThemeLight,
      //TODO appBarTheme: appBarThemeLight,
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: AppColors.primary,
      //     foregroundColor: AppColors.white,
      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      //     textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      //   ),
      // ),
      // outlinedButtonTheme: OutlinedButtonThemeData(
      //   style: OutlinedButton.styleFrom(
      //     foregroundColor: AppColors.primary,
      //     side: const BorderSide(color: AppColors.primary, width: 2),
      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      //     textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      //   ),
      // ),
      //TODO inputDecorationTheme: inputDecorationThemeLight,
      //TODO textTheme: _textTheme(color: AppColors.black, secondaryColor: AppColors.text),
      //TODO iconTheme: const IconThemeData(color: AppColors.text),
      //   cardTheme: CardThemeData(
      //     color: AppColors.white,
      //     elevation: 2,
      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //     margin: const EdgeInsets.all(8),
      //   ),
      //   dialogTheme: DialogThemeData(
      //     backgroundColor: AppColors.white,
      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //     titleTextStyle: const TextStyle(
      //       color: AppColors.black,
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //     ),
      //     contentTextStyle: const TextStyle(color: AppColors.text, fontSize: 16),
      //   ),
      //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //     backgroundColor: AppColors.white,
      //     selectedItemColor: AppColors.primary,
      //     unselectedItemColor: AppColors.grey5,
      //     elevation: 8,
      //     type: BottomNavigationBarType.fixed,
      //     selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      //     unselectedLabelStyle: TextStyle(fontSize: 12),
      //   ),
      //   tabBarTheme: const TabBarThemeData(
      //     labelColor: AppColors.primary,
      //     unselectedLabelColor: AppColors.grey5,
      //     indicatorSize: TabBarIndicatorSize.label,
      //     indicator: UnderlineTabIndicator(
      //       borderSide: BorderSide(color: AppColors.primary, width: 3),
      //     ),
      //     labelStyle: TextStyle(fontWeight: FontWeight.w600),
      //     unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
      //   ),
      //   sliderTheme: SliderThemeData(
      //     activeTrackColor: AppColors.primary,
      //     inactiveTrackColor: AppColors.primaryLight,
      //     thumbColor: AppColors.primaryDark,
      //     overlayColor: AppColors.primary.withOpacity(0.2),
      //     valueIndicatorColor: AppColors.primary,
      //   ),
      //   tooltipTheme: TooltipThemeData(
      //     decoration: BoxDecoration(
      //       color: AppColors.black.withOpacity(0.8),
      //       borderRadius: BorderRadius.circular(4),
      //     ),
      //     textStyle: const TextStyle(color: AppColors.white, fontSize: 12),
      //   ),
      //   filledButtonTheme: filledButtonThemeLight,
      //   textButtonTheme: textButtonThemeLight,
    );
  }
}
