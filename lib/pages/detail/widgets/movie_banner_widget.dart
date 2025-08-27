import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../components/btn_icon_widget.dart';
import '../../../utils/enums.dart';
import '../../../widgets/buttons/btn_filled_widdget.dart';
import '../../../widgets/buttons/btn_outlined_widdget.dart';


class MovieBannerWidget extends StatelessWidget {
  const MovieBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  'detail/banner2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5],
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 50, bottom: 100),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('John Wick 4', style: context.styles.onPrimaryS(55)),
                  SizedBox(height: 15),
                  Text('2h 49m - 2023-USA', style: context.styles.onPrimary),
                  Row(
                    children: [for (int i = 0; i < 4; i++) Icon(Icons.star_rounded, color: context.colors.warning)],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      BtnIconWidget(
                        icon: Icon(
                          Icons.turned_in_not_rounded,
                          size: 25,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(width: 30),
                      BtnIconWidget(
                        icon: Icon(
                          Icons.thumb_up_alt_outlined,
                          size: 25,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(width: 10),
                      BtnIconWidget(
                        icon: Icon(
                          Icons.thumb_down_alt_outlined,
                          size: 25,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(bottom: 100, right: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'detail/jw-title.png',
                    width: 500,
                  ),
                  SizedBox(height: 150),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BtnFilledWiddget(
                        btnSize: BtnSize.m,
                        onPressed: () {},
                        text: 'Watch Now',
                      ),
                      SizedBox(width: 10),
                      BtnOutlinedWiddget(
                        btnSize: BtnSize.m,
                        onPressed: () {},
                        text: 'Preview',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
