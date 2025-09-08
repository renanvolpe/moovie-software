import 'package:flutter/foundation.dart';
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
              builder: (context) => SelectionArea(child: WebPageGuard(child: child!)),
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

class WebPageGuard extends StatelessWidget {
  final Widget child; // your real page

  const WebPageGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return const Scaffold(
        body: Center(
          child: Text("❌ This app is only available on Web."),
        ),
      );
    }

    final width = MediaQuery.of(context).size.width;

    // if (width < 1056) {
    //   return const Scaffold(
    //     body: Center(
    //       child: Text(
    //         "⚠️ Screen size not supported.\nPlease open on a larger screen.",
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //   );
    // }

    return child;
  }
}
