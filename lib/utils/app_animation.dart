import 'package:flutter/material.dart';

class AppUtils {
  // Animation durations
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 600);

  // Border radius
  static const BorderRadius borderRadiusXS = BorderRadius.all(Radius.circular(4));
  static const BorderRadius borderRadiusS = BorderRadius.all(Radius.circular(8));
  static const BorderRadius borderRadiusM = BorderRadius.all(Radius.circular(12));
  static const BorderRadius borderRadiusL = BorderRadius.all(Radius.circular(20));
  static const BorderRadius borderRadiusXL = BorderRadius.all(Radius.circular(32));
  static const BorderRadius borderRadiusXXL = BorderRadius.all(Radius.circular(60));

  // Spacing / padding
  static const EdgeInsets paddingXS = EdgeInsets.all(4);
  static const EdgeInsets paddingS = EdgeInsets.all(8);
  static const EdgeInsets paddingM = EdgeInsets.all(16);
  static const EdgeInsets paddingL = EdgeInsets.all(24);
  static const EdgeInsets paddingXL = EdgeInsets.all(32);
}
