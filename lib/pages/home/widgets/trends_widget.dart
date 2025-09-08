import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_software/pages/home/home_controller.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../components/btn_see_more_widget.dart';
import '../../../components/image_movie_widget.dart';
import '../../../utils/item_width_caluclator.dart';

class TrendsWidget extends HookWidget {
  const TrendsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => HomeController());
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Trends",
                  style: context.styles.onPrimaryS(26),
                ),
                Spacer(),
                BtnSeeMoreWidget(
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 15),

          Expanded(
            child: TrendsHorizontalList(controller: controller),
          ),
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

    final itemWidth = itemWidthCalculator(screenWidth, spacing);

    return ListView.separated(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: controller.listTrends.length,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      separatorBuilder: (context, index) => const SizedBox(width: spacing),
      itemBuilder: (context, index) {
        return SizedBox(
          width: itemWidth,
          child: ImageMovieWidget(
            path: controller.listTrends[index].path,
            name: controller.listTrends[index].name,
            onTap: () {},
          ),
        );
      },
    );
  }

  
}
