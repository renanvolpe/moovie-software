import 'package:flutter/material.dart';

import '../models/profiel_model.dart';
import '../pages/login/login.dart';
import '../pages/profile/profile.dart';
import '../pages/profile_selected/profile_selected.dart';
import 'app_animation.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
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
        page = (_) => ProfileSelected(profileModel: args as ProfileModel);
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
