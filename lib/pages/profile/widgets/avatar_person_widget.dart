import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/app_animation.dart';

import '../../../models/profiel_model.dart';
import '../../../utils/hoverable_mixin.dart';
import '../../../widgets/buttons/hover_btn_widget.dart';

class AvatarPersonWidget extends StatefulWidget {
  const AvatarPersonWidget({
    super.key,
    required this.profileModel,
    required this.onTap,
    this.size = 100,
    this.increaseOnHove = true,
  });
  final ProfileModel profileModel;
  final VoidCallback? onTap;
  final double size;
  final bool increaseOnHove;
  @override
  State<AvatarPersonWidget> createState() => _AvatarPersonWidgetState();
}

class _AvatarPersonWidgetState extends State<AvatarPersonWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          HoverTapWidget(
            onHover: widget.increaseOnHove ? handleHover : (_) {},
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: AppUtils.fast,
              curve: Curves.easeOut,
              width: isHovered ? widget.size * 1.1 : widget.size,
              height: isHovered ? widget.size * 1.1 : widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(widget.profileModel.imageAsset),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(widget.profileModel.name, style: context.styles.onSurfaceS(16)),
        ],
      ),
    );
  }
}
