import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../utils/app_animation.dart';
import '../utils/hoverable_mixin.dart';
import '../widgets/buttons/hover_btn_widget.dart';

class BtnIconWidget extends StatefulWidget {
  const BtnIconWidget({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final Icon icon;
  final VoidCallback onTap;

  @override
  State<BtnIconWidget> createState() => BtnIconWidgetState();
}

class BtnIconWidgetState extends State<BtnIconWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: HoverTapWidget(
        onTap: widget.onTap,
        onHover: handleHover,
        child: GestureDetector(
          onTap: widget.onTap,
          behavior: HitTestBehavior.opaque,
          child: SelectionContainer.disabled(
            child: AnimatedContainer(
              duration: AppUtils.fast,
              decoration: BoxDecoration(
                color: isHovered ? context.colors.onSecondaryColor.withAlpha(20) : null,
                borderRadius: AppUtils.borderRadiusL,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.icon,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
