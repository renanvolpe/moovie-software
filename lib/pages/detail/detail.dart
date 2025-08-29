import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_software/components/fade_scroll.dart';
import 'package:movie_software/components/fade_start.dart';
import 'package:movie_software/pages/detail/widgets/director_movies_widget.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../components/appbar/app_bar_widget.dart';
import '../../components/author_wiget.dart';
import 'widgets/charactors_movies_widget.dart';
import 'widgets/comment_movie_widget.dart';
import 'widgets/genres_movie_widget.dart';
import 'widgets/images_moovies_widget.dart';
import 'widgets/movie_banner_widget.dart';
import 'widgets/suggestions_like_widget.dart';
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
            FadeInOnScroll(
              scrollController: scrollController,
              child: GenresMovieWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: CharactorsMoviesWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: DirectorsMoviesWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: SuggestionsLikeWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: CommentsMovieWidget(),
            ),
            SizedBox(height: 50),
            FadeInOnScroll(
              scrollController: scrollController,
              child: AuthorWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
