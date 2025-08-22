import 'dart:async';

import 'package:flutter/material.dart';

class ImageLoginController extends ChangeNotifier {
  ImageLoginController({required this.vsync}) {
    _initAnimations();
    _startTimer();
  }

  int currentIndex = 0;
  Timer? _timer;

  late AnimationController textController;
  late Animation<double> textOffset;
  late Animation<double> textFade;

  final TickerProvider vsync;

  void _initAnimations() {
    textController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 5),
    );

    textFade = CurvedAnimation(
      parent: textController,
      curve: const Interval(0.0, 0.8, curve: Curves.easeIn),
    );

    textOffset =
        Tween<double>(
          begin: -50,
          end: 50,
        ).animate(
          CurvedAnimation(
            parent: textController,
            curve: Curves.linear,
          ),
        );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      next();
    });
    textController.forward();
  }

  void next() {
    currentIndex = (currentIndex + 1) % images.length;
    textController.reset();
    textController.forward();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    textController.dispose();
    super.dispose();
  }

  final List<String> images = [
    'assets/login-1.png',
    'assets/login-2.png',
    'assets/login-3.png',
    'assets/login-4.png',
    'assets/login-5.png',
    'assets/login-6.png',
  ];

  final List<String> texts = [
    "Discover New Worlds",
    "Your Next Movie Awaits",
    "Stream Without Limits",
    "Cinema in Your Hands",
    "Stories That Inspire",
    "Entertainment Anywhere",
  ];
}
