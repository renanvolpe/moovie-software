import 'package:flutter/material.dart'; // Essential import for Flutter widgets and classes
import '../color/app_color.dart' show AppColors;

class AppTextStyles {
  final BuildContext _context;
  AppTextStyles(this._context);

  ColorScheme get _colorScheme => Theme.of(_context).colorScheme;

  TextTheme get _appTextTheme => Theme.of(_context).textTheme;

  // Primary color styles
  TextStyle get primary => _appTextTheme.bodyMedium!.copyWith(
        color: _colorScheme.primary,
      );
  TextStyle primaryS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: _colorScheme.primary,
      );

  // OnPrimary color styles
  TextStyle get onPrimary => _appTextTheme.bodyMedium!.copyWith(
        color: _colorScheme.onPrimary,
      );
  TextStyle onPrimaryS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: _colorScheme.onPrimary,
      );

  // OnPrimaryContainer color styles
  TextStyle get onPrimaryContainer => _appTextTheme.bodyMedium!.copyWith(
        color: _colorScheme.onPrimaryContainer,
      );
  TextStyle onPrimaryContainerS(double fontSize) =>
      _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: _colorScheme.onPrimaryContainer,
      );

  // Secondary color styles
  TextStyle get secondary => _appTextTheme.bodyMedium!.copyWith(
        color: _colorScheme.secondary,
      );
  TextStyle secondaryS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: _colorScheme.secondary,
      );

  // OnSecondary color styles
  TextStyle get onSecondary => _appTextTheme.bodyMedium!.copyWith(
        color: _colorScheme.onSecondary,
      );
  TextStyle onSecondaryS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: _colorScheme.onSecondary,
      );

  // OnBackground color styles (using onSurface as common for background-related text)
  TextStyle get onBackground => _appTextTheme.bodyMedium!.copyWith(
        color: _colorScheme.onSurface,
      );
  TextStyle onBackgroundS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: _colorScheme.onSurface,
      );

  // OnSurface color styles
  TextStyle get onSurface => _appTextTheme.bodyMedium!.copyWith(
        color: _colorScheme.onSurface,
      );
  TextStyle onSurfaceS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: _colorScheme.onSurface,
      );

  // OnSurfaceVariant color styles
  TextStyle get onSurfaceVariant => _appTextTheme.bodyMedium!.copyWith(
        color: _colorScheme.onSurfaceVariant,
      );
  TextStyle onSurfaceVariantS(double fontSize) =>
      _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: _colorScheme.onSurfaceVariant,
      );

  // Error color styles
  TextStyle get error => _appTextTheme.bodyMedium!.copyWith(
        color: _colorScheme.error,
      );
  TextStyle errorS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: _colorScheme.error,
      );

  // OnError color styles
  TextStyle get onError => _appTextTheme.bodyMedium!.copyWith(
        color: _colorScheme.onError,
      );
  TextStyle onErrorS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: _colorScheme.onError,
      );

  // Custom colors from AppColors
  TextStyle get success => _appTextTheme.bodyMedium!.copyWith(
        color: AppColors.success,
      );
  TextStyle successS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: AppColors.success,
      );

  TextStyle get warning => _appTextTheme.bodyMedium!.copyWith(
        color: AppColors.warning,
      );
  TextStyle warningS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: AppColors.warning,
      );

  TextStyle get black => _appTextTheme.bodyMedium!.copyWith(
        color: AppColors.black,
      );
  TextStyle blackS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: AppColors.black,
      );

  TextStyle get white => _appTextTheme.bodyMedium!.copyWith(
        color: AppColors.white,
      );
  TextStyle whiteS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: AppColors.white,
      );

  TextStyle get gray => _appTextTheme.bodyMedium!.copyWith(
        color: AppColors.gray,
      );
  TextStyle grayS(double fontSize) => _appTextTheme.bodyMedium!.copyWith(
        fontSize: fontSize,
        color: AppColors.gray,
      );

  // Common Decorations/Weights (utility methods to apply common styles)
  TextStyle bold(TextStyle baseStyle) => baseStyle.copyWith(
        fontWeight: FontWeight.bold,
      );
  TextStyle lineThrough(TextStyle baseStyle) => baseStyle.copyWith(
        decoration: TextDecoration.lineThrough,
      );
  TextStyle underline(TextStyle baseStyle) => baseStyle.copyWith(
        decoration: TextDecoration.underline,
      );
}