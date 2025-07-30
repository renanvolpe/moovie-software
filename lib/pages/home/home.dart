import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../components/appbar/app_bar_widget.dart';
import '../../utils/enums.dart';
import '../../widgets/buttons/btn_filled_widdget.dart';
import '../../widgets/buttons/btn_outlined_widdget.dart';
import 'widgets/banner_widget.dart';

class ControllerGet {
  Future<String> getData(int count) async {
    await Future.delayed(const Duration(seconds: 1));
    return "I'm the output: $count";
  }

  Future<String> getSecondData(int count) async {
    await Future.delayed(const Duration(seconds: 1));
    return "I'm the output: 2 ${count + 100}";
  }
}

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerWidget(),
            SizedBox(
              height: 600,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Trends",
                    style: context.styles.onPrimaryS(30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
