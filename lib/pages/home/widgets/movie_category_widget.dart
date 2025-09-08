import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/item_width_caluclator.dart';

import '../../../components/btn_see_more_widget.dart';
import '../../../components/category_widget.dart';
import '../../../components/image_movie_widget.dart';
import '../home_controller.dart';

class MovieCategoryWidget extends HookWidget {
  const MovieCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => HomeController());
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.55,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Movies",
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
          CategoriesListWidget(controller: controller),
          SizedBox(height: 15),
          Expanded(
            child: MoviesHorizontalListWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}

class MoviesHorizontalListWidget extends HookWidget {
  const MoviesHorizontalListWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    final screenWidth = MediaQuery.of(context).size.width;
    const spacing = 20.0;

    final itemWidth = itemWidthCalculator(screenWidth, spacing);
    final listMoovies = controller.listTrends.reversed.toList();
    return ListView.separated(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: listMoovies.length,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      separatorBuilder: (context, index) => const SizedBox(width: spacing),
      itemBuilder: (context, index) {
        return SizedBox(
          width: itemWidth,
          child: ImageMovieWidget(
            path: listMoovies[index].path,
            name: listMoovies[index].name,
            onTap: () {},
          ),
        );
      },
    );
  }
}

class CategoriesListWidget extends HookWidget {
  const CategoriesListWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    final listMoovies = controller.listCategories.reversed.toList();
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(Icons.chevron_left),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: listMoovies.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return CategoryWidget(
                  name: listMoovies[index].name,
                  onTap: () {},
                  isSelected: index == 2,
                );
              },
            ),
          ),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
