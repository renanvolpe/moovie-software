import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/hoverable_mixin.dart';
import 'package:movie_software/widgets/buttons/hover_btn_widget.dart';

import '../../../components/image_movie_widget.dart';
import '../../../models/trends_model.dart';
import '../../../widgets/buttons/switch_widget.dart';

class CollectionWiddget extends StatelessWidget {
  const CollectionWiddget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TrendsModel> listCollection = List.from(mockTrendsMovies)..shuffle();
    return SizedBox(
      // height: 800,
      // width: 700,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Collection",
                  style: context.styles.onPrimaryS(26),
                ),
                Spacer(),
                SizedBox(
                  width: 180,
                  child: SwitchWidget(
                    value: false,
                    onChanged: (t) {},
                    left: Text("Series"),
                    right: Text("Movies"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            spacing: 20,
            children: [
              Expanded(
                child: SizedBox(
                  height: 230,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return HorizontalCollectionsWidget(
                        path: listCollection[index].path,
                        name: listCollection[index].name,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class HorizontalCollectionsWidget extends StatefulWidget {
  const HorizontalCollectionsWidget({
    super.key,
    required this.path,
    required this.name,
  });
  final String path;
  final String name;

  @override
  State<HorizontalCollectionsWidget> createState() => _HorizontalCollectionsWidgetState();
}

class _HorizontalCollectionsWidgetState extends State<HorizontalCollectionsWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return HoverTapWidget(
      onHover: handleHover,
      child: SizedBox(
        height: 210,
        width: 180,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 200,
                width: 150,
                child: IgnorePointer(
                  ignoring: true,
                  child: ImageMovieWidget(
                    path: widget.path,
                    name: '',
                    onTap: () {},
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 200,
                width: 150,
                child: IgnorePointer(
                  ignoring: true,
                  child: ImageMovieWidget(
                    path: widget.path,
                    name: '',
                    onTap: () {},
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 200,
                width: 150,
                child: IgnorePointer(
                  ignoring: true,
                  child: ImageMovieWidget(
                    path: widget.path,
                    name: '',
                    onTap: () {},
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: isHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  color: context.colors.surface.withOpacity(0.6),
                  child: Column(
                    children: [
                      const Spacer(),
                      Center(
                        child: AutoSizeText(
                          widget.name,
                          textAlign: TextAlign.center,
                          style: context.styles.onPrimaryS(20),
                        ),
                      ),
                      const Spacer(),
                    ],
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
