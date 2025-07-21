import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../models/profiel_model.dart';
import '../../widgets/components/container_initial.dart';
import '../profile_selected/profile_selected.dart';
import 'profile_controller.dart';
import 'widgets/avatar_person_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin, SlideFadeAnimationMixin {
  final ProfileController controller = ProfileController();
  final Map<int, AnimationController> scaleControllers = {};

  @override
  void initState() {
    super.initState();
    setupSlideFadeAnimation();
  }

  void startScaleAnimation(int index, ProfileModel profile) {
    controller.profile = profile;
    scaleControllers[index]?.forward();
  }

  @override
  void dispose() {
    for (final c in scaleControllers.values) {
      c.dispose();
    }
    super.dispose();
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
                                      // Create animation controller per avatar
                                      scaleControllers.putIfAbsent(
                                        i,
                                        () => AnimationController(
                                          vsync: this,
                                          duration: const Duration(milliseconds: 300),
                                        ),
                                      );

                                      final scale = Tween<double>(begin: 1.0, end: 0.0).animate(
                                        CurvedAnimation(
                                          parent: scaleControllers[i]!,
                                          curve: Curves.easeInOut,
                                        ),
                                      );

                                      return AnimatedBuilder(
                                        animation: scale,
                                        builder: (_, child) => Transform.scale(
                                          scale: scale.value,
                                          child: child,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: AvatarPersonWidget(
                                            profileModel: controller.listProfiles[i],
                                            onTap: () => startScaleAnimation(i, controller.listProfiles[i]),
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
}
