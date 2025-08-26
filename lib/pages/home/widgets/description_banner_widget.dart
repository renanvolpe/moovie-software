import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../utils/enums.dart';
import '../../../utils/navigation.dart';
import '../../../widgets/buttons/btn_filled_widdget.dart';
import '../../../widgets/buttons/btn_outlined_widdget.dart';

class DescriptionBannerWidget extends StatelessWidget {
  const DescriptionBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "The Witcher",
          style: context.styles.onSecondaryS(36),
        ),
        SizedBox(height: 10),
        Text(
          "Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts",
          style: context.styles.onSecondary,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < 4; i++)
              Icon(
                Icons.star,
                color: context.colors.warning,
                size: 15,
              ),
            SizedBox(width: 15),
            Image.asset('assets/iimdb-icon.png', height: 15),
            SizedBox(width: 15),
            Image.asset('assets/netflix-icon.png', height: 15),
          ],
        ),
        SizedBox(height: 15),
        Row(
          spacing: 10,
          children: [
            BtnFilledWiddget(
              text: "Watch Movie",
              btnSize: BtnSize.m,
              icon: Icon(Icons.play_arrow_rounded),
              isRounded: true,
              onPressed: () => Navigator.pushNamed(context, AppRoutes.detail),
            ),
            BtnOutlinedWiddget(
              text: "More Info",
              btnSize: BtnSize.s,
              isRounded: true,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
