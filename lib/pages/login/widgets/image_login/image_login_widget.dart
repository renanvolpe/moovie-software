import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import 'image_login_controller.dart';

class ImageLoginWidget extends StatefulWidget {
  const ImageLoginWidget({super.key});

  @override
  State<ImageLoginWidget> createState() => _ImageLoginWidgetState();
}

class _ImageLoginWidgetState extends State<ImageLoginWidget> with TickerProviderStateMixin {
  late final ImageLoginController controller;

  @override
  void initState() {
    super.initState();
    controller = ImageLoginController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, _) => SizedBox.expand(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                child: Image.asset(
                  controller.images[controller.currentIndex],
                  key: ValueKey(controller.images[controller.currentIndex]),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            /// Moving text
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: AnimatedBuilder(
                  animation: controller.textOffset,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(controller.textOffset.value, 0),
                      child: child,
                    );
                  },
                  child: Text(
                    controller.texts[controller.currentIndex],
                    textAlign: TextAlign.center,
                    style: context.styles.onPrimaryS(22),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
