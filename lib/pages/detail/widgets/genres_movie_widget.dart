import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../components/category_widget.dart';
import '../../../models/categories_model.dart';

class GenresMovieWidget extends HookWidget {
  const GenresMovieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          AutoSizeText("Genres", style: context.styles.onPrimaryS(40)),
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return CategoryWidget(
                  name: mockCategories[index].name,
                  onTap: () {},
                  isSelected: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
