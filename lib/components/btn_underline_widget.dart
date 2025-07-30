
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../utils/app_animation.dart';
import '../utils/hoverable_mixin.dart';
import '../widgets/buttons/hover_btn_widget.dart';

class BtnUnderlineWidget extends StatefulWidget {
  const BtnUnderlineWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  });

  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  State<BtnUnderlineWidget> createState() => BtnUnderlineWidgetState();
}

class BtnUnderlineWidgetState extends State<BtnUnderlineWidget> with HoverableMixin {
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
                borderRadius: AppUtils.borderRadiusS,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.text,
                    key: ValueKey(widget.text),
                    style: widget.isSelected
                        ? context.styles.whiteS(16).copyWith(fontWeight: FontWeight.w700)
                        : context.styles.whiteS(16),
                  ),
                  const SizedBox(height: 4),
                  AnimatedSwitcher(
                    duration: AppUtils.fast,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SizeTransition(
                          sizeFactor: animation,
                          axis: Axis.horizontal,
                          child: child,
                        ),
                      );
                    },
                    child: widget.isSelected
                        ? Stack(
                            key: const ValueKey(true),
                            children: [
                              ImageFiltered(
                                imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: Container(
                                  height: 2,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: context.colors.primary,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              Container(
                                height: 2,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: context.colors.primary.withOpacity(0.03),
                                  borderRadius: AppUtils.borderRadiusS,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(
                            key: ValueKey(false),
                            height: 2,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
