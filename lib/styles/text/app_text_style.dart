import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleCustom {
  static final TextTheme _latoTextTheme = GoogleFonts.latoTextTheme();

  // Helper to apply common style adjustments and optional color override
  static TextStyle _applyStyle(
    BuildContext context,
    TextStyle baseStyle, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) {
    return baseStyle.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: decoration,
    );
  }

  // Material Design TextTheme styles with optional color override
  // Default colors: onBackground (for display/headline/body), onSurface (for title), onSurfaceVariant (for label)

  static TextStyle displayLarge(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.displayLarge!,
      color: color ?? Theme.of(context).colorScheme.onBackground,
    );
  }

  static TextStyle displayMedium(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.displayMedium!,
      color: color ?? Theme.of(context).colorScheme.onBackground,
    );
  }

  static TextStyle displaySmall(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.displaySmall!,
      color: color ?? Theme.of(context).colorScheme.onBackground,
    );
  }

  static TextStyle headlineLarge(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.headlineLarge!,
      color: color ?? Theme.of(context).colorScheme.onBackground,
    );
  }

  static TextStyle headlineMedium(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.headlineMedium!,
      color: color ?? Theme.of(context).colorScheme.onBackground,
    );
  }

  static TextStyle headlineSmall(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.headlineSmall!,
      color: color ?? Theme.of(context).colorScheme.onBackground,
    );
  }

  static TextStyle titleLarge(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.titleLarge!,
      color: color ?? Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle titleMedium(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.titleMedium!,
      color: color ?? Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle titleSmall(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.titleSmall!,
      color: color ?? Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle bodyLarge(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.bodyLarge!,
      color: color ?? Theme.of(context).colorScheme.onBackground,
    );
  }

  static TextStyle bodyMedium(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.bodyMedium!,
      color: color ?? Theme.of(context).colorScheme.onBackground,
    );
  }

  static TextStyle bodySmall(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.bodySmall!,
      color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle labelLarge(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.labelLarge!,
      color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle labelMedium(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.labelMedium!,
      color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle labelSmall(BuildContext context, {Color? color}) {
    return _applyStyle(
      context,
      _latoTextTheme.labelSmall!,
      color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }
}
