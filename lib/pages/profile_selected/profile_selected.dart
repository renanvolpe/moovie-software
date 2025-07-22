import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/enums.dart';
import 'package:movie_software/widgets/buttons/btn_outlined_widdget.dart';

import '../../models/profiel_model.dart';
import '../../widgets/components/container_initial.dart';
import '../profile/widgets/avatar_person_widget.dart';
import 'profile_selected_controller.dart';
import 'widgets/scale_fade_animation.dart';

class ProfileSelected extends StatefulWidget {
  const ProfileSelected({super.key, required this.profileModel});

  final ProfileModel profileModel;

  @override
  State<ProfileSelected> createState() => _ProfileSelectedState();
}

class _ProfileSelectedState extends State<ProfileSelected> with TickerProviderStateMixin, ScaleFadeAnimationMixin {
  late final ProfileSelectedController controller;

  @override
  void initState() {
    super.initState();
    controller = ProfileSelectedController(widget.profileModel);
    setupscaleFadeAnimation();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 300));
      controller.isLoading = false;
      fadeController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerInitial(
        child: ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: scaleController,
                    child: Align(
                      alignment: Alignment.center,
                      child: AvatarPersonWidget(
                        profileModel: controller.profileModel,
                        onTap: () {},
                        isDisable: true,
                        size: 200,
                      ),
                    ),
                  ),
                  if (controller.isLoading)
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: CircularProgressIndicator(),
                    )
                  else
                    FadeTransition(
                      opacity: fadeAnimation,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            '${controller.profileModel.name}, your account has been successfully created ',
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
