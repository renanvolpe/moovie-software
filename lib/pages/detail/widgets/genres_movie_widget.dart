import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../components/category_widget.dart';
import '../../../models/categories_model.dart';

class GenresMovieWidget extends StatelessWidget {
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
          Row(
            spacing: 10,
            children: [
              for (int i = 0; i < 4; i++)
                CategoryWidget(
                  name: mockCategories[i].name,
                  onTap: () {},
                  isSelected: true,
                ),
            ],
          ),
        ],
      ),
    );
  }
}