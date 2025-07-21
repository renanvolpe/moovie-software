
import 'package:flutter/material.dart';

mixin SlideFadeAnimationMixin<T extends StatefulWidget> on State<T>, TickerProviderStateMixin<T> {
  late AnimationController slideController;
  late AnimationController fadeController;

  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;

  Duration get slideDuration => const Duration(milliseconds: 600);
  Duration get fadeDuration => const Duration(milliseconds: 500);

  bool _hasTriggered = false;

  void setupSlideFadeAnimation() {
    slideController = AnimationController(vsync: this, duration: slideDuration);
    fadeController = AnimationController(vsync: this, duration: fadeDuration);

    slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.easeOut,
          ),
        );

    fadeAnimation = CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeIn,
    );

    // Start initial animations
    triggerSlideFadeTransition();
  }

  void triggerSlideFadeTransition() {
    if (_hasTriggered) return;
    _hasTriggered = true;

    slideController.forward().whenComplete(() {
      fadeController.forward();
    });
  }

  @mustCallSuper
  @override
  void dispose() {
    slideController.dispose();
    fadeController.dispose();
    super.dispose();
  }
}
