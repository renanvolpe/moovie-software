import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/enums.dart';
import 'package:movie_software/widgets/buttons/btn_outlined_widdget.dart';

import '../../widgets/components/container_initial.dart';
import 'profile_selected_controller.dart';

class ProfileSelected extends StatefulWidget {
  const ProfileSelected({super.key, required this.index});

  final int index;

  @override
  State<ProfileSelected> createState() => _ProfileSelectedState();
}

class _ProfileSelectedState extends State<ProfileSelected> with TickerProviderStateMixin, SlideFadeAnimationMixin {
  final ProfileSelectedController controller = ProfileSelectedController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 800));
      controller.isLoading = false;
    });
    setupSlideFadeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ContainerInitial(
        child: ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            if (controller.isLoading) return Center(child: CircularProgressIndicator());
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 80,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 80,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          Text(
                            ': ${1}',
                            style: context.styles.blackS(30).copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your account has been successfully created User ${1}',
                    style: context.styles.onSurfaceS(23),
                  ),
                  SizedBox(height: 20),
                  BtnOutlinedWiddget(
                    onPressed: () {},
                    btnSize: BtnSize.m,
                    text: 'WATCH MOVIES',
                  ),
                ],
              ),
            );
          },
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
