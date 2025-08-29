import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/app_animation.dart';

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
                duration: AppUtils.slow,
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
                  animation: controller.titleOffset,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: controller.titleFade,
                      child: Transform.translate(
                        offset: Offset(controller.titleOffset.value, 0),
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    controller.titles[controller.currentIndex],
                    textAlign: TextAlign.center,
                    style: context.styles.onPrimaryS(30),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: AnimatedBuilder(
                  animation: controller.subtitleOffset,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: controller.subtitleFade,
                      child: Transform.translate(
                        offset: Offset(controller.subtitleOffset.value, 0),
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    controller.subtitles[controller.currentIndex],
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
