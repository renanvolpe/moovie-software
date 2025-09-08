
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../utils/app_utils.dart';
import '../../../utils/hoverable_mixin.dart';
import '../../../widgets/buttons/hover_btn_widget.dart';

class ImagesMoovieWidget extends StatelessWidget {
  const ImagesMoovieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 1; i < 6; i++) ImageResumeWidget(i: i),
      ],
    );
  }
}

class ImageResumeWidget extends StatefulWidget {
  const ImageResumeWidget({
    super.key,
    required this.i,
  });

  final int i;

  @override
  State<ImageResumeWidget> createState() => _ImageResumeWidgetState();
}

class _ImageResumeWidgetState extends State<ImageResumeWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return HoverTapWidget(
      onHover: handleHover,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: context.colors.primary),
          borderRadius: AppUtils.borderRadiusM,
        ),
        clipBehavior: Clip.antiAlias,
        child: ClipRRect(
          borderRadius: AppUtils.borderRadiusM,
          child: AnimatedScale(
            duration: AppUtils.fast,
            scale: isHovered ? 1.1 : 1.0,
            child: Image.asset(
              'assets/resume(${widget.i}).png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
