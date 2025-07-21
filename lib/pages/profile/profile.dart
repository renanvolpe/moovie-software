import 'package:flutter/material.dart';
import 'package:movie_software/pages/profile/profile_controller.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/hoverable_mixin.dart';

import '../../widgets/buttons/hover_btn_widget.dart';
import '../../widgets/components/container_initial.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin, SlideFadeAnimationMixin {
  final ProfileController controller = ProfileController();

  @override
  void initState() {
    super.initState();
    setupSlideFadeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ContainerInitial(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
            ListenableBuilder(
              listenable: controller,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SlideTransition(
                      position: slideAnimation,
                      child: Opacity(
                        opacity: controller.isSelected ? 0.0 : 1.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 80,
                              child: Icon(
                                Icons.person,
                                color: context.colors.onSurface,
                                size: 80,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Renan_volpe",
                              style: context.styles.onSurfaceS(16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "You have successfully logged in",
                              style: context.styles.onSurfaceS(35),
                            ),
                            const SizedBox(height: 30),
                            FadeTransition(
                              opacity: fadeAnimation,
                              child: Column(
                                children: [
                                  Text(
                                    "Choose your Profile",
                                    style: context.styles.onSurfaceS(18),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (int i = 0; i < 4; i++)
                                        GestureDetector(
                                          onTap: () {
                                            slideController.reset();
                                            fadeController.reset();
                                            Navigator.pushNamed(context, '/profile/detail', arguments: i);
                                          },
                                          child: AvatarPersonWidget(index: i),
                                        ),
                                      SizedBox(width: 15),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarPersonWidget extends StatefulWidget {
  const AvatarPersonWidget({super.key, required this.index});
  final int index;
  @override
  State<AvatarPersonWidget> createState() => _AvatarPersonWidgetState();
}

class _AvatarPersonWidgetState extends State<AvatarPersonWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: HoverTapWidget(
        onHover: handleHover,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          width: isHovered ? 80 : 70,
          height: isHovered ? 80 : 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.person,
                size: isHovered ? 40 : 35,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Text('${widget.index + 1}'.toString(), style: context.styles.black.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

mixin SlideFadeAnimationMixin<T extends StatefulWidget> on State<T>, TickerProviderStateMixin<T> {
  late AnimationController slideController;
  late AnimationController fadeController;

  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;

  Duration get slideDuration => const Duration(milliseconds: 600);
  Duration get fadeDuration => const Duration(milliseconds: 500);

  bool _hasTriggered = false;

  void setupSlideFadeAnimation() {
    slideController = AnimationController(vsync: this, duration: slideDuration);
    fadeController = AnimationController(vsync: this, duration: fadeDuration);

    slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.easeOut,
          ),
        );

    fadeAnimation = CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeIn,
    );

    // Start initial animations
    triggerSlideFadeTransition();
  }

  void triggerSlideFadeTransition() {
    if (_hasTriggered) return;
    _hasTriggered = true;

    slideController.forward().whenComplete(() {
      fadeController.forward();
    });
  }

  @mustCallSuper
  @override
  void dispose() {
    slideController.dispose();
    fadeController.dispose();
    super.dispose();
  }
}
