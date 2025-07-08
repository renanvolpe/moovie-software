import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color/app_color.dart' show AppColors;

class AppTextStyles {
  final BuildContext _context;
  AppTextStyles(this._context);

  ColorScheme get _colorScheme => Theme.of(_context).colorScheme;

  static final TextTheme _latoTextTheme = GoogleFonts.latoTextTheme();

  TextStyle get primary =>
      _latoTextTheme.bodyMedium!.copyWith(color: _colorScheme.primary);
  TextStyle primaryS(double fontSize) => _latoTextTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    color: _colorScheme.primary,
  );

  TextStyle get onPrimary =>
      _latoTextTheme.bodyMedium!.copyWith(color: _colorScheme.onPrimary);
  TextStyle onPrimaryS(double fontSize) => _latoTextTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    color: _colorScheme.onPrimary,
  );

  TextStyle get onPrimaryContainer => _latoTextTheme.bodyMedium!.copyWith(
    color: _colorScheme.onPrimaryContainer,
  );
  TextStyle onPrimaryContainerS(double fontSize) => _latoTextTheme.bodyMedium!
      .copyWith(fontSize: fontSize, color: _colorScheme.onPrimaryContainer);

  TextStyle get secondary =>
      _latoTextTheme.bodyMedium!.copyWith(color: _colorScheme.secondary);
  TextStyle secondaryS(double fontSize) => _latoTextTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    color: _colorScheme.secondary,
  );

  TextStyle get onSecondary =>
      _latoTextTheme.bodyMedium!.copyWith(color: _colorScheme.onSecondary);
  TextStyle onSecondaryS(double fontSize) => _latoTextTheme.bodyMedium!
      .copyWith(fontSize: fontSize, color: _colorScheme.onSecondary);

  TextStyle get onBackground =>
      _latoTextTheme.bodyMedium!.copyWith(color: _colorScheme.onSurface);
  TextStyle onBackgroundS(double fontSize) => _latoTextTheme.bodyMedium!
      .copyWith(fontSize: fontSize, color: _colorScheme.onSurface);

  TextStyle get onSurface =>
      _latoTextTheme.bodyMedium!.copyWith(color: _colorScheme.onSurface);
  TextStyle onSurfaceS(double fontSize) => _latoTextTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    color: _colorScheme.onSurface,
  );

  TextStyle get onSurfaceVariant =>
      _latoTextTheme.bodyMedium!.copyWith(color: _colorScheme.onSurfaceVariant);
  TextStyle onSurfaceVariantS(double fontSize) => _latoTextTheme.bodyMedium!
      .copyWith(fontSize: fontSize, color: _colorScheme.onSurfaceVariant);

  TextStyle get error =>
      _latoTextTheme.bodyMedium!.copyWith(color: _colorScheme.error);
  TextStyle errorS(double fontSize) => _latoTextTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    color: _colorScheme.error,
  );

  TextStyle get onError =>
      _latoTextTheme.bodyMedium!.copyWith(color: _colorScheme.onError);
  TextStyle onErrorS(double fontSize) => _latoTextTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    color: _colorScheme.onError,
  );

  TextStyle get success =>
      _latoTextTheme.bodyMedium!.copyWith(color: AppColors.springGreen);
  TextStyle successS(double fontSize) => _latoTextTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    color: AppColors.springGreen,
  );

  TextStyle get warning =>
      _latoTextTheme.bodyMedium!.copyWith(color: AppColors.goldenFizz);
  TextStyle warningS(double fontSize) => _latoTextTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    color: AppColors.goldenFizz,
  );

  TextStyle get black =>
      _latoTextTheme.bodyMedium!.copyWith(color: AppColors.black);
  TextStyle blackS(double fontSize) => _latoTextTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    color: AppColors.black,
  );

  TextStyle get white =>
      _latoTextTheme.bodyMedium!.copyWith(color: AppColors.white);
  TextStyle whiteS(double fontSize) => _latoTextTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    color: AppColors.white,
  );

  TextStyle get gray =>
      _latoTextTheme.bodyMedium!.copyWith(color: AppColors.gray);
  TextStyle grayS(double fontSize) => _latoTextTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    color: AppColors.gray,
  );

  // --- Common Decorations/Weights ---

  TextStyle bold(TextStyle baseStyle) =>
      baseStyle.copyWith(fontWeight: FontWeight.bold);
  TextStyle lineThrough(TextStyle baseStyle) =>
      baseStyle.copyWith(decoration: TextDecoration.lineThrough);
  TextStyle underline(TextStyle baseStyle) =>
      baseStyle.copyWith(decoration: TextDecoration.underline);
}
