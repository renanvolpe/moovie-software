import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../utils/app_animation.dart';
import '../../utils/navigation.dart';
import '../../widgets/components/container_initial.dart';
import 'profile_controller.dart';
import 'widgets/avatar_person_widget.dart';
import 'widgets/scale_animation_mixin.dart';
import 'widgets/slide_fade_animation_mixin.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin, SlideFadeAnimationMixin, ScaleAnimationMixin {
  final ProfileController controller = ProfileController();

  @override
  void initState() {
    super.initState();
    setupSlideFadeAnimation();
    initScaleController(controller.listProfiles.length);
    _listenChangePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            Text("Renan_volpe", style: context.styles.onSurfaceS(16)),
                            const SizedBox(height: 10),
                            Text("You have successfully logged in", style: context.styles.onSurfaceS(35)),
                            const SizedBox(height: 30),
                            FadeTransition(
                              opacity: fadeAnimation,
                              child: Column(
                                children: [
                                  Text("Choose your Profile", style: context.styles.onSurfaceS(18)),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(controller.listProfiles.length, (i) {
                                      scaleControllers.putIfAbsent(
                                        i,
                                        () => AnimationController(
                                          vsync: this,
                                          duration: AppUtils.fast,
                                        ),
                                      );

                                      return AnimatedBuilder(
                                        animation: getScale(i),
                                        builder: (_, child) => Transform.scale(
                                          scale: getScale(i).value,
                                          child: child,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: AvatarPersonWidget(
                                            profileModel: controller.listProfiles[i],
                                            onTap: () {
                                              controller.profile = controller.listProfiles[i];
                                              scaleControllers[i]!.forward();
                                            },
                                          ),
                                        ),
                                      );
                                    }),
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

  void _listenChangePage() {
    for (var sController in scaleControllers.values) {
      sController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushNamed(
            context,
            AppRoutes.profileDetail,
            arguments: controller.profileSelected!,
          );
        }
      });
    }
  }
}
