import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../utils/app_utils.dart';
import '../utils/hoverable_mixin.dart';
import '../widgets/buttons/hover_btn_widget.dart';

class BtnSeeMoreWidget extends StatefulWidget {
  const BtnSeeMoreWidget({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  State<BtnSeeMoreWidget> createState() => _BtnSeeMoreWidgetState();
}

class _BtnSeeMoreWidgetState extends State<BtnSeeMoreWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return HoverTapWidget(
      onHover: handleHover,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: AppUtils.fast,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          color: isHovered ? context.colors.onPrimaryColor.withValues(alpha: 0.05) : Colors.transparent,
          borderRadius: AppUtils.borderRadiusL,
        ),
        child: Row(
          children: [
            Text("See More", style: context.styles.primary.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward_rounded, color: context.colors.primary),
          ],
        ),
      ),
    );
  }
}
