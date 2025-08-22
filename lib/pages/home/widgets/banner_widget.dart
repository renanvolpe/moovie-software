import 'package:flutter/material.dart';

import 'description_banner_widget.dart';
import 'movies_banner_widget.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
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
