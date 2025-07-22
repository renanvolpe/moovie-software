import 'package:flutter/material.dart';

import '../../../utils/app_animation.dart';

mixin ScaleFadeAnimationMixin<T extends StatefulWidget> on State<T>, TickerProviderStateMixin<T> {
  late AnimationController scaleController;
  late AnimationController fadeController;

  late Animation<Offset> scaleAnimation;
  late Animation<double> fadeAnimation;

  Duration get scaleDuration => AppUtils.fast;
  Duration get fadeDuration => AppUtils.slow;

  void setupscaleFadeAnimation() {
    scaleController = AnimationController(vsync: this, duration: scaleDuration);
    fadeController = AnimationController(vsync: this, duration: fadeDuration);

    scaleAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: scaleController,
            curve: Curves.easeOut,
          ),
        );

    fadeAnimation = CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeIn,
    );

    scaleController.forward();
  }

  @mustCallSuper
  @override
  void dispose() {
    scaleController.dispose();
    fadeController.dispose();
    super.dispose();
  }
}
