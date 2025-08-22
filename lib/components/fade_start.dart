import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FadeInOnStart extends HookWidget {
  final Widget child;
  const FadeInOnStart({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 800),
    )..forward();

    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
