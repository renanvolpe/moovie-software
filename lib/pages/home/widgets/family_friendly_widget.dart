import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/app_utils.dart';
import 'package:movie_software/utils/enums.dart';
import 'package:movie_software/widgets/buttons/btn_outlined_widdget.dart';

class FamilyFriendlyWidget extends StatelessWidget {
  const FamilyFriendlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: width,
      color: context.colors.primary,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text("Family-friendly streaming", style: context.styles.onPrimaryS(30)),
            SizedBox(height: 40),
            AutoSizeText(
              "create kids profile, set parental control, and choose rating levels. Easily findnew favorites by srting by characters and using age filters.",
              style: context.styles.onPrimaryS(15),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Builder(
              builder: (context) {
                if (width < AppUtils.widthMobile) {
                  return Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 1; i < 3; i++)
                          Expanded(
                            child: Image.asset(
                              'assets/family-$i.png',
                            ),
                          ),
                        SizedBox(width: 20),
                      ],
                    ),
                  );
                }
                return Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 15,
                    children: [
                      SizedBox(width: 150),
                      for (int i = 1; i < 4; i++)
                        Image.asset(
                          'assets/family-$i.png',
                          fit: BoxFit.contain,
                        ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 100),
            BtnOutlinedWiddget(
              onPressed: () {},
              text: "Watch the children's section",
              btnSize: BtnSize.l,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
