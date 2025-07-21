import 'package:flutter/material.dart';

import '../../styles/color/app_color.dart';

class ContainerInitial extends StatelessWidget {
  const ContainerInitial({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blackLight,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          tileMode: TileMode.clamp,
          stops: [0.2, 0.8, 1],
          colors: [
            AppColors.black,
            AppColors.backgroundDark,
            AppColors.secondaryDarker,
          ],
        ),
      ),
      child: child,
    );
  }
}
