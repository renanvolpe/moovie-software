import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_software/models/trends_model.dart';
import 'package:movie_software/pages/home/home_controller.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/hoverable_mixin.dart';
import 'package:movie_software/widgets/buttons/hover_btn_widget.dart';

import '../../../components/btn_see_more_widget.dart';
import '../../../utils/app_animation.dart';

class TrendsWidget extends HookWidget {
  const TrendsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => HomeController());
    return SizedBox(
      height: 600,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Trends",
                  style: context.styles.onPrimaryS(30),
                ),
                Spacer(),
                BtnSeeMoreWidget(
                  onTap: () {},
                ),
              ],
            ),
          ),
          TrendsHorizontalList(controller: controller),
        ],
      ),
    );
  }
}

class TrendsHorizontalList extends HookWidget {
  final HomeController controller;

  const TrendsHorizontalList({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    final screenWidth = MediaQuery.of(context).size.width;
    const spacing = 20.0;

    final itemWidth = (screenWidth - (spacing * (8 - 1))) / 6.5;

    return SizedBox(
      height: 250,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: controller.listTrends.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        separatorBuilder: (context, index) => const SizedBox(width: spacing),
        itemBuilder: (context, index) {
          return SizedBox(
            width: itemWidth,
            child: ImageMovieWidget(
              model: controller.listTrends[index],
              controller: controller,
            ),
          );
        },
      ),
    );
  }
}

class ImageMovieWidget extends StatefulWidget {
  const ImageMovieWidget({super.key, required this.controller, required this.model});

  final HomeController controller;
  final TrendsModel model;

  @override
  State<ImageMovieWidget> createState() => _ImageMovieWidgetState();
}

class _ImageMovieWidgetState extends State<ImageMovieWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return HoverTapWidget(
      onHover: handleHover,
      child: ClipRRect(
        borderRadius: AppUtils.borderRadiusS,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                widget.model.path,
                fit: BoxFit.cover,
              ),
            ),
            Center(
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
                        widget.model.name,
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
