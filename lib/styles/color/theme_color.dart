import 'package:flutter/material.dart';

import 'app_color.dart' show AppColors;

class ThemeColor {
  final BuildContext _context;
  ThemeColor(this._context);

  ColorScheme get _colorScheme => Theme.of(_context).colorScheme;

  /// Primary -> Summer Sky (#228EE5)
  Color get primary => _colorScheme.primary;

  /// On Primary -> White (#FFFFFF) in light, Alice Blue (#EBFAFF) in dark
  Color get onPrimaryColor => _colorScheme.onPrimary;

  /// Primary Container -> Summer Sky (#228EE5) - usually same as primary or a slight variation
  Color get primaryContainer => _colorScheme.primaryContainer;

  /// On Primary Container -> White (#FFFFFF) in light, Alice Blue (#EBFAFF) in dark
  Color get onPrimaryContainerColor => _colorScheme.onPrimaryContainer;

  /// Secondary -> Deep Cerise (#E5228D)
  Color get secondary => _colorScheme.secondary;

  /// On Secondary -> White (#FFFFFF)
  Color get onSecondaryColor => _colorScheme.onSecondary;

  /// Secondary Container -> Deep Cerise (#E5228D)
  Color get secondaryContainer => _colorScheme.secondaryContainer;

  /// On Secondary Container -> White (#FFFFFF)
  Color get onSecondaryContainerColor => _colorScheme.onSecondaryContainer;

  /// Tertiary -> Dark Green (#030A1B) in light, Golden Fizz (#E5DB22) in dark
  Color get tertiary => _colorScheme.tertiary;

  /// On Tertiary -> White (#FFFFFF) in light, Black (#000000) in dark
  Color get onTertiaryColor => _colorScheme.onTertiary;

  /// Tertiary Container -> Dark Green (#030A1B) in light, Golden Fizz (#E5DB22) in dark
  Color get tertiaryContainer => _colorScheme.tertiaryContainer;

  /// On Tertiary Container -> White (#FFFFFF) in light, Black (#000000) in dark
  Color get onTertiaryContainerColor => _colorScheme.onTertiaryContainer;

  /// Background -> Alice Blue (#EBFAFF) in light, Dark Green Background (#030A1B) in dark
  Color get background => _colorScheme.surface;

  /// On Background -> Black (#000000) in light, White (#FFFFFF) in dark
  Color get onBackground => _colorScheme.onSurface;

  /// Surface -> White (#FFFFFF) in light, Dark Green Background (#030A1B) in dark
  Color get surface => _colorScheme.surface;

  /// On Surface -> Black (#000000) in light, White (#FFFFFF) in dark
  Color get onSurface => _colorScheme.onSurface;

  /// Surface Variant -> Alice Blue Background (#EBFAFF) in light, Black (#000000) in dark
  Color get surfaceVariant => _colorScheme.surfaceContainerHighest;

  /// On Surface Variant -> Black (#000000) in light, White (#FFFFFF) in dark
  Color get onSurfaceVariant => _colorScheme.onSurfaceVariant;

  /// Error -> Alizarin Light/Dark (Varies by theme)
  Color get error => _colorScheme.error;

  /// On Error -> White (#FFFFFF)
  Color get onErrorCode => _colorScheme.onError;

  /// Error Container -> Alizarin Light/Dark (Varies by theme)
  Color get errorContainer => _colorScheme.errorContainer;

  /// On Error Container -> White (#FFFFFF)
  Color get onErrorContainerColor => _colorScheme.onErrorContainer;

  /// Outline -> Gray (#808080)
  Color get outline => _colorScheme.outline;

  /// Outline Variant -> Gray (#808080)
  Color get outlineVariant => _colorScheme.outlineVariant;

  /// Shadow -> Black (#000000)
  Color get shadow => _colorScheme.shadow;

  /// Scrim -> Black (0x99000000)
  Color get scrim => _colorScheme.scrim;

  /// Inverse Primary -> Dark Green Background (#030A1B) in light, Summer Sky (#228EE5) in dark
  Color get inversePrimary => _colorScheme.inversePrimary;

  /// Inverse Surface -> Dark Green Background (#030A1B) in light, Alice Blue Background (#EBFAFF) in dark
  Color get inverseSurface => _colorScheme.inverseSurface;

  /// On Inverse Surface -> White (#FFFFFF) in light, Black (#000000) in dark
  Color get onInverseSurface => _colorScheme.onInverseSurface;

  Color get successColor => AppColors.springGreen;
  Color get warningColor => AppColors.goldenFizz;
}
