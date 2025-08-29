import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.size = 150});
  final double size;

  @override
  Widget build(BuildContext context) {
    var isLigthTheme = Theme.of(context).brightness == Brightness.light;
    return SizedBox(
      child: Image.asset(
        isLigthTheme ? 'assets/logo-dark.png' : 'assets/logo-light.png',
        width: 100,
        height: 100,
      ),
    );
  }
}
