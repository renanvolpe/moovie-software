import 'package:flutter/material.dart';
import 'package:movie_software/utils/app_utils.dart';

mixin ScaleAnimationMixin<T extends StatefulWidget> on State<T>, TickerProviderStateMixin<T> {
  final Map<int, AnimationController> scaleControllers = {};

  void initScaleController(int length) {
    for (int i = 0; i < length; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: AppUtils.fast,
      );

      scaleControllers[i] = controller;
    }
  }

  Animation<double> getScale(int index) {
    final controller = scaleControllers[index];
    if (controller == null) {
      throw Exception('Controller for index $index not initialized. Call initScaleController($index) first.');
    }

    return Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @mustCallSuper
  @override
  void dispose() {
    for (final c in scaleControllers.values) {
      c.dispose();
    }
    super.dispose();
  }
}
