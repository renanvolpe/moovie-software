import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../components/appbar/app_bar_widget.dart';
import 'widgets/banner_widget.dart';
import 'widgets/collection_widget.dart';
import 'widgets/globe_awards_widget.dart';
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
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
