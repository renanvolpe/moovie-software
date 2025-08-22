import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../components/appbar/app_bar_widget.dart';
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
    return Scaffold(
      appBar: AppBarWidget(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          spacing: 40,
          children: [
            BannerWidget(),
            TrendsWidget(),
            MovieCategoryWidget(),
            SizedBox(height: 80),
            GlobeAwardsWidget(),
            MovieCategoryWidget(),
            PriceWidget(),
            CollectionWiddget(),
            ContinueWatchingWidget(),
            CharactorsWidget(),
            FamilyFriendlyWidget(),
            ListStudiosWidget(),
            AuthorWidget(),
          ],
        ),
      ),
    );
  }
}
