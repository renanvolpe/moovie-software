import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../models/trends_model.dart';


class MoviesBannerWidget extends StatefulWidget {
  const MoviesBannerWidget({
    super.key,
  });

  @override
  State<MoviesBannerWidget> createState() => _MoviesBannerWidgetState();
}

class _MoviesBannerWidgetState extends State<MoviesBannerWidget> {
  final controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 450,
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Swiper(
                autoplay: true,
                controller: controller,
                itemBuilder: (context, index) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.grabbing,
                    child: Image.asset(
                      mockTrendsMovies.reversed.toList()[index].path,
                      fit: BoxFit.scaleDown,
                    ),
                  );
                },
                itemCount: mockTrendsMovies.length,
                itemWidth: 200.0,
                layout: SwiperLayout.STACK,
                control: SwiperControl(color: context.colors.onPrimaryColor),
              ),
            ),
          ),
          SizedBox(width: 50),
        ],
      ),
    );
  }
}
