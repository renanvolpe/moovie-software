import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_software/components/fade_scroll.dart';
import 'package:movie_software/components/fade_start.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../components/appbar/app_bar_widget.dart';
import 'widgets/images_moovies_widget.dart';
import 'widgets/movie_banner_widget.dart';
import 'widgets/text_about_moovie_widget.dart';

class Detail extends HookWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: context.colors.background,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            FadeInOnStart(
              child: MovieBannerWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: ImagesMoovieWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: TextAboutMoovieWidget(),
            ),

            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}

