import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../components/appbar/app_bar_widget.dart';
import '../../components/fade_scroll.dart';
import '../../components/fade_start.dart';
import 'widgets/author_wiget.dart';
import 'widgets/banner_widget.dart';
import 'widgets/charactors_widget.dart';
import 'widgets/collection_widget.dart';
import 'widgets/continue_watching_widget.dart';
import 'widgets/family_friendly_widget.dart';
import 'widgets/globe_awards_widget.dart';
import 'widgets/list_studios_widget.dart';
import 'widgets/movie_category_widget.dart';
import 'widgets/price_widget.dart';
import 'widgets/trends_widget.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return Scaffold(
      appBar: AppBarWidget(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          spacing: 40,
          children: [
            FadeInOnStart(
              child: BannerWidget(),
            ),
            FadeInOnStart(
              child: TrendsWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: MovieCategoryWidget(),
            ),
            const SizedBox(height: 80),
            FadeInOnScroll(
              scrollController: scrollController,
              child: GlobeAwardsWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: MovieCategoryWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: PriceWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: CollectionWiddget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: ContinueWatchingWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: CharactorsWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: FamilyFriendlyWidget(),
            ),
            FadeInOnScroll(
              scrollController: scrollController,
              child: ListStudiosWidget(),
            ),
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
