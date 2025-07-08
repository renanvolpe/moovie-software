import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/material.dart';

import 'styles/theme/theme.dart' show AppTheme;
import 'widgets/layout_summary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppCustomScrollBehavior(),
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: SelectionArea(child: const LayoutSummary()),
    );
  }
}

class AppCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    // Allow to drag with mouse on Regions carousel
    PointerDeviceKind.mouse,
  };
}
