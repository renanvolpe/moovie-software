import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../utils/app_utils.dart';

class GlobeAwardsWidget extends StatelessWidget {
  const GlobeAwardsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    final Color dark = const Color(0xFF050B1A);
    final Color gold = const Color(0xFFE0A825);

    return Container(
      height: height * 0.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            dark.withOpacity(0.0),
            gold,
            gold,
            dark.withOpacity(0.0),
          ],
          stops: [0.06, 0.12, 0.88, 0.94],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Builder(
        builder: (context) {
          if (width < AppUtils.widthMobile) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.1),
                      Expanded(child: Image.asset('assets/globe-title.png')),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: context.colors.background.withOpacity(0.6),
                          borderRadius: AppUtils.borderRadiusXXL,
                          border: Border.all(width: 1, color: context.colors.onPrimaryColor),
                        ),
                        child: AutoSizeText(
                          "Watching Golden Globe 2024 Movies",
                          textAlign: TextAlign.center,
                          style: context.styles.onPrimaryS(14),
                        ),
                      ),
                      SizedBox(height: 15),
                      Expanded(child: Image.asset('assets/globe-movies.png')),
                      SizedBox(height: height * 0.1),
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Padding(
                //     padding: const EdgeInsets.only(bottom: 100),
                //     child: Container(
                //       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                //       decoration: BoxDecoration(
                //         color: context.colors.background.withOpacity(0.6),
                //         borderRadius: AppUtils.borderRadiusXXL,
                //         border: Border.all(width: 1, color: context.colors.onPrimaryColor),
                //       ),
                //       child: AutoSizeText(
                //         "Watching Golden Globe 2024 Movies",
                //         textAlign: TextAlign.center,
                //         style: context.styles.onPrimaryS(30),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            );
          }
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Expanded(child: Image.asset('assets/globe-title.png')),
                    SizedBox(width: 20),
                    Expanded(child: Image.asset('assets/globe-movies.png')),
                    SizedBox(width: 20),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    decoration: BoxDecoration(
                      color: context.colors.background.withOpacity(0.6),
                      borderRadius: AppUtils.borderRadiusXXL,
                      border: Border.all(width: 1, color: context.colors.onPrimaryColor),
                    ),
                    child: AutoSizeText(
                      "Watching Golden Globe 2024 Movies",
                      textAlign: TextAlign.center,
                      style: context.styles.onPrimaryS(30),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
