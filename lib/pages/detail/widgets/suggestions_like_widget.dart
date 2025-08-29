import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../components/image_movie_widget.dart';
import '../../../models/trends_model.dart';
class SuggestionsLikeWidget extends HookWidget {
  const SuggestionsLikeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    final screenWidth = MediaQuery.of(context).size.width;
    const spacing = 20.0;

    final itemWidth = (screenWidth - (spacing * (8 - 1))) / 6.5;

    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              children: [
                Text("Suggestion like “John Wick”", style: context.styles.onPrimaryS(40)),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                separatorBuilder: (context, index) => const SizedBox(width: spacing),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: itemWidth,
                    child: ImageMovieWidget(
                      path: mockTrendsMovies.reversed.toList()[index].path,
                      name: mockTrendsMovies.reversed.toList()[index].name,
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

