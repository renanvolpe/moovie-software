import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_software/utils/app_animation.dart';

class FadeInOnScroll extends HookWidget {
  final Widget child;
  final ScrollController scrollController;
  const FadeInOnScroll({
    super.key,
    required this.child,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final key = useMemoized(() => GlobalKey());
    final controller = useAnimationController(duration: AppUtils.slow);
    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );

    useEffect(() {
      void listener() {
        final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero).dy;
          final screenHeight = MediaQuery.of(context).size.height;

          if (position < screenHeight * 0.85) {
            if (!controller.isAnimating && controller.value == 0) {
              controller.forward();
            }
          }
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    return FadeTransition(
      opacity: animation,
      child: Container(
        key: key,
        child: child,
      ),
    );
  }
}
