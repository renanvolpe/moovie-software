import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../components/appbar/app_bar_widget.dart';
import 'widgets/banner_widget.dart';
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
          children: [BannerWidget(), TrendsWidget()],
        ),
      ),
    );
  }
}
