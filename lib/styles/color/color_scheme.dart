import 'package:flutter/material.dart';
import 'app_color.dart' show AppColors;

/// Light theme color scheme
final ColorScheme colorSchemeLight = const ColorScheme.light(
  primary: AppColors.primary,
  onPrimary: AppColors.white,
  primaryContainer: AppColors.primary,
  onPrimaryContainer: AppColors.white,

  secondary: AppColors.secondary,
  onSecondary: AppColors.white,
  secondaryContainer: AppColors.secondary,
  onSecondaryContainer: AppColors.white,

  tertiary: AppColors.backgroundDark,
  onTertiary: AppColors.white,
  tertiaryContainer: AppColors.backgroundDark,
  onTertiaryContainer: AppColors.white,

  surface: AppColors.backgroundLight,
  onSurface: AppColors.black,
  surfaceContainerHighest: AppColors.backgroundLight,
  onSurfaceVariant: AppColors.black,

  error: AppColors.alert,
  onError: AppColors.white,
  errorContainer: AppColors.alert,
  onErrorContainer: AppColors.white,

  outline: AppColors.gray,
  outlineVariant: AppColors.gray,
  shadow: AppColors.black,
  scrim: AppColors.black,

  inversePrimary: AppColors.backgroundDark,
  inverseSurface: AppColors.backgroundDark,
  onInverseSurface: AppColors.white,
);

/// Dark theme color scheme
final ColorScheme colorSchemeDark = const ColorScheme.dark(
  primary: AppColors.primary,
  onPrimary: AppColors.surface,
  primaryContainer: AppColors.primary,
  onPrimaryContainer: AppColors.surface,

  secondary: AppColors.secondary,
  onSecondary: AppColors.white,
  secondaryContainer: AppColors.secondary,
  onSecondaryContainer: AppColors.white,

  tertiary: AppColors.warning,
  onTertiary: AppColors.black,
  tertiaryContainer: AppColors.warning,
  onTertiaryContainer: AppColors.black,

  surface: AppColors.backgroundDark,
  onSurface: AppColors.white,
  surfaceContainerHighest: AppColors.black,
  onSurfaceVariant: AppColors.white,

  error: AppColors.error,
  onError: AppColors.white,
  errorContainer: AppColors.error,
  onErrorContainer: AppColors.white,

  outline: AppColors.gray,
  outlineVariant: AppColors.gray,
  shadow: AppColors.black,
  scrim: AppColors.black,

  inversePrimary: AppColors.primary,
  inverseSurface: AppColors.backgroundLight,
  onInverseSurface: AppColors.black,
);
