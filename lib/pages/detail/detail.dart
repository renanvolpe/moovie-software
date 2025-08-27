import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_software/components/fade_start.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../components/appbar/app_bar_widget.dart';
import 'widgets/movie_banner_widget.dart';

class Detail extends HookWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: context.colors.background,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInOnStart(
              child: MovieBannerWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
