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

  late Animation<double> titleFade;
  late Animation<double> titleOffset;

  late Animation<double> subtitleFade;
  late Animation<double> subtitleOffset;

  final TickerProvider vsync;

  void _initAnimations() {
    textController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 5),
    );

    // Title animation (fade + offset)
    titleFade = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeIn)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(1),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1, end: 0).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
    ]).animate(textController);

    titleOffset = Tween<double>(
      begin: -50,
      end: 50,
    ).animate(
      CurvedAnimation(
        parent: textController,
        curve: Curves.linear,
      ),
    );

    // Subtitle animation (slightly delayed fade + smaller offset)
    subtitleFade = TweenSequence([
      TweenSequenceItem(
        tween: ConstantTween<double>(0),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeIn)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(1),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1, end: 0).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
    ]).animate(textController);

    subtitleOffset = Tween<double>(
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

  final List<String> titles = [
    "Discover New Worlds",
    "Your Next Movie Awaits",
    "Stream Without Limits",
    "Cinema in Your Hands",
    "Stories That Inspire",
    "Entertainment Anywhere",
  ];

  final List<String> subtitles = [
    "Explore beyond the screen",
    "Start your adventure today",
    "No barriers, just fun",
    "All the cinema in your pocket",
    "Inspiration for everyone",
    "Anytime, anywhere you are",
  ];
}
