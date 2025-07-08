import 'package:flutter/material.dart';

import 'color/theme_color.dart' show ThemeColor;
import 'text/text_style.dart' show AppTextStyles;

extension ContextStyle on BuildContext {
  AppTextStyles get styles => AppTextStyles(this);

  ThemeColor get colors => ThemeColor(this);
}
