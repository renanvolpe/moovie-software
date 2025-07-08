import 'package:flutter/material.dart';

import 'app_color.dart' show AppColors;

final ColorScheme colorSchemeLight = const ColorScheme.light(
  primary: AppColors.summerSky,
  onPrimary: AppColors.white,
  primaryContainer: AppColors.summerSky,
  onPrimaryContainer: AppColors.white,

  secondary: AppColors.deepCerise,
  onSecondary: AppColors.white,
  secondaryContainer: AppColors.deepCerise,
  onSecondaryContainer: AppColors.white,

  tertiary: AppColors.darkGreen,
  onTertiary: AppColors.white,
  tertiaryContainer: AppColors.darkGreen,
  onTertiaryContainer: AppColors.white,

  surface: AppColors.aliceBlueBackground,
  onSurface: AppColors.black,

  surfaceContainerHighest: AppColors.aliceBlueBackground,
  onSurfaceVariant: AppColors.black,

  error: AppColors.alizarinLight,
  onError: AppColors.white,
  errorContainer: AppColors.alizarinLight,
  onErrorContainer: AppColors.white,

  outline: AppColors.gray,
  outlineVariant: AppColors.gray,
  shadow: AppColors.black,
  scrim: AppColors.black,

  inversePrimary: AppColors.darkGreenBackground,
  inverseSurface: AppColors.darkGreenBackground,
  onInverseSurface: AppColors.white,
);

final ColorScheme colorSchemeDark = const ColorScheme.dark(
  primary: AppColors.summerSky,
  onPrimary: AppColors.aliceBlueMain,
  primaryContainer: AppColors.summerSky,
  onPrimaryContainer: AppColors.aliceBlueMain,

  secondary: AppColors.deepCerise,
  onSecondary: AppColors.white,
  secondaryContainer: AppColors.deepCerise,
  onSecondaryContainer: AppColors.white,

  tertiary: AppColors.goldenFizz,
  onTertiary: AppColors.black,
  tertiaryContainer: AppColors.goldenFizz,
  onTertiaryContainer: AppColors.black,

  surface: AppColors.darkGreenBackground,
  onSurface: AppColors.white,
  surfaceContainerHighest: AppColors.black,
  onSurfaceVariant: AppColors.white,

  error: AppColors.alizarinDark,
  onError: AppColors.white,
  errorContainer: AppColors.alizarinDark,
  onErrorContainer: AppColors.white,

  outline: AppColors.gray,
  outlineVariant: AppColors.gray,
  shadow: AppColors.black,
  scrim: AppColors.black,

  inversePrimary: AppColors.summerSky,
  inverseSurface: AppColors.aliceBlueBackground,
  onInverseSurface: AppColors.black,
);
