import 'dart:async';

import 'package:flutter/material.dart';

class ImageLoginWidget extends StatefulWidget {
  const ImageLoginWidget({super.key});

  @override
  State<ImageLoginWidget> createState() => _ImageLoginWidgetState();
}

class _ImageLoginWidgetState extends State<ImageLoginWidget> {
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/login-1.png',
    'assets/login-2.png',
    'assets/login-3.png',
    'assets/login-4.png',
    'assets/login-5.png',
    'assets/login-6.png',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        child: Image.asset(
          _images[_currentIndex],
          key: ValueKey(_images[_currentIndex]),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
