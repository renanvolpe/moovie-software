import 'package:flutter/material.dart';

import '../../../utils/app_utils.dart';
import 'description_banner_widget.dart';
import 'movies_banner_widget.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    if (width < AppUtils.widthMobile) {
      return SizedBox(
        // height: height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    height: height * 0.4,
                    'assets/banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: 600,
              child: DescriptionBannerWidget(),
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 25),
                Expanded(child: MoviesBannerWidget()),
              ],
            ),
          ],
        ),
      );
    }
    return SizedBox(
      height: height * 0.9,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/banner.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: 600,
              child: DescriptionBannerWidget(),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: MoviesBannerWidget(),
          ),
        ],
      ),
    );
  }
}
