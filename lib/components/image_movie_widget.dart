
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../utils/app_animation.dart';
import '../utils/hoverable_mixin.dart';
import '../widgets/buttons/hover_btn_widget.dart';

class ImageMovieWidget extends StatefulWidget {
  const ImageMovieWidget({super.key, required this.path, required this.name, required this.onTap,});

  final String path;
  final String name;
  final VoidCallback onTap;

  @override
  State<ImageMovieWidget> createState() => _ImageMovieWidgetState();
}

class _ImageMovieWidgetState extends State<ImageMovieWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return HoverTapWidget(
      onTap: widget.onTap,
      onHover: handleHover,
      child: ClipRRect(
        borderRadius: AppUtils.borderRadiusS,
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedScale(
                scale: isHovered ? 1.1 : 1.0,
                duration: AppUtils.fast,
                curve: Curves.easeOut,
                child: Image.asset(
                  widget.path,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned.fill(
              child: AnimatedContainer(
                duration: AppUtils.fast,
                color: isHovered ? context.colors.background.withValues(alpha: 0.8) : Colors.transparent,
                child: Center(
                  child: AnimatedOpacity(
                    opacity: isHovered ? 1.0 : 0.0,
                    duration: AppUtils.fast,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: AutoSizeText(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: context.styles.onPrimaryS(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
