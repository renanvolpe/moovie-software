import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../styles/color/app_color.dart';
import '../utils/app_animation.dart';
import '../utils/hoverable_mixin.dart';
import '../widgets/buttons/hover_btn_widget.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    super.key,
    required this.name,
    required this.onTap,
    required this.isSelected,
  });

  final String name;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> with HoverableMixin {
  bool isSelected = false;

  @override
  void didChangeDependencies() {
    setState(() {
      isSelected = widget.isSelected;
    });
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CategoryWidget oldWidget) {
    if (oldWidget.isSelected != widget.isSelected) isSelected = widget.isSelected;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = _getBackgroundColor();
    final borderColor = _getBorderColor();

    return Center(
      child: HoverTapWidget(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
          widget.onTap;
        },
        onHover: handleHover,
        child: AnimatedOpacity(
          duration: AppUtils.fast,
          curve: Curves.easeInOut,
          opacity: isHovered || isSelected ? 1.0 : 0.6,
          child: AnimatedContainer(
            duration: AppUtils.fast,
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: AppUtils.borderRadiusL,
              border: Border.all(color: borderColor),
            ),
            child: Text(
              widget.name,
              style: context.styles.onPrimaryS(12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (isHovered && isSelected) return AppColors.alertDark;
    if (isSelected) return AppColors.alertLight;
    return context.colors.background;
  }

  Color _getBorderColor() {
    if (isSelected) return Colors.transparent;
    if (isHovered) return AppColors.alertDark;
    return AppColors.alertLight;
  }
}
