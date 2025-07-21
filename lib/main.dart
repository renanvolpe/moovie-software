import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:movie_software/pages/profile/profile.dart';
import 'package:movie_software/pages/profile_selected/profile_selected.dart';
import 'package:movie_software/utils/app_animation.dart';

import 'pages/login/login.dart';
import 'styles/theme/theme.dart' show AppTheme;

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
      onGenerateRoute: (settings) => _onGenerateRoute(settings),
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

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  final args = settings.arguments;

  late WidgetBuilder page;
  try {
    switch (settings.name) {
      case AppRoutes.login:
        page = (_) => const Login();
        break;

      case AppRoutes.profile:
        page = (_) => const Profile();
        break;

      case AppRoutes.profileDetail:
        page = (_) => ProfileSelected(index: args as int);
        break;

      default:
        page = (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        );
    }
  } catch (e) {
    page = (_) => const Scaffold(
      body: Center(child: Text('Invalid arguments for the Page')),
    );
  }

  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, __, ___) => SelectionArea(child: page(context)),
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    transitionDuration: AppUtils.fast,
  );
}

class AppRoutes {
  static const String login = '/';
  static const String profile = '/profile';
  static const String profileDetail = '/profile/detail';
  static const String home = '/home';
  static const String movie = '/movie';
}
