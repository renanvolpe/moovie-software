
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../components/btn_icon_widget.dart';
import '../../../utils/enums.dart';
import '../../../widgets/buttons/btn_filled_widdget.dart';
import '../../../widgets/buttons/btn_outlined_widdget.dart';

class MovieBannerMobileWidget extends StatelessWidget {
  const MovieBannerMobileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/banner2.png',
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Image.asset(
                            'assets/jw-title.png',
                            width: width * 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'John Wick 4',
                        style: context.styles.onPrimaryS(22),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      Text('2h 49m - 2023-USA', style: context.styles.onPrimaryS(14)),
                    ],
                  ),

                  Row(
                    children: [
                      Row(
                        children: [
                          for (int i = 0; i < 4; i++) Icon(Icons.star_rounded, color: context.colors.warning),
                        ],
                      ),
                      Spacer(),
                      BtnIconWidget(
                        icon: Icon(
                          Icons.turned_in_not_rounded,
                          size: 17,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(width: 30),
                      BtnIconWidget(
                        icon: Icon(
                          Icons.thumb_up_alt_outlined,
                          size: 17,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(width: 10),
                      BtnIconWidget(
                        icon: Icon(
                          Icons.thumb_down_alt_outlined,
                          size: 17,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
