import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../utils/app_utils.dart';
import '../utils/hoverable_mixin.dart';
import '../widgets/buttons/hover_btn_widget.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({
    super.key,
    required this.name,
    required this.comment,
    required this.likes,
    required this.dislikes,
    required this.path,
  });
  final String name;
  final String comment;
  final int likes;
  final int dislikes;
  final String path;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return HoverTapWidget(
      onHover: handleHover,
      child: AnimatedContainer(
        duration: AppUtils.fast,
        height: 120,
        width: 200,
        padding: AppUtils.paddingS,
        decoration: BoxDecoration(
          borderRadius: AppUtils.borderRadiusM,
          border: Border.all(
            color: isHovered ? context.colors.background : context.colors.primary,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.path),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: AppUtils.fast,
                    style: isHovered ? context.styles.primary : context.styles.onPrimary,
                    child: Text(widget.name),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: AnimatedDefaultTextStyle(
                duration: AppUtils.fast,
                style: isHovered ? context.styles.primaryS(12) : context.styles.onPrimaryS(12),
                child: Text(
                  widget.comment,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 3,
              children: [
                TweenAnimationBuilder<Color?>(
                  tween: ColorTween(
                    begin: context.colors.onPrimaryColor,
                    end: isHovered ? context.colors.primary : context.colors.onPrimaryColor,
                  ),
                  duration: AppUtils.fast,
                  builder: (context, color, child) {
                    return Icon(Icons.thumb_down, size: 15, color: color);
                  },
                ),
                Text('${widget.dislikes}', style: context.styles.grayS(12)),
                const SizedBox(width: 10),
                TweenAnimationBuilder<Color?>(
                  tween: ColorTween(
                    begin: context.colors.onPrimaryColor,
                    end: isHovered ? context.colors.primary : context.colors.onPrimaryColor,
                  ),
                  duration: AppUtils.fast,
                  builder: (context, color, child) {
                    return Icon(Icons.thumb_up, size: 15, color: color);
                  },
                ),
                Text('${widget.likes}', style: context.styles.grayS(12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
