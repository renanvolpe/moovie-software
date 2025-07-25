import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/material.dart';

import 'styles/theme/theme.dart' show AppTheme;
import 'utils/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppCustomScrollBehavior(),
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => SelectionArea(child: child!),
            ),
          ],
        );
      },

      initialRoute: '/',
      onGenerateRoute: (settings) => onGenerateRoute(settings),
    );
  }
}

class AppCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
