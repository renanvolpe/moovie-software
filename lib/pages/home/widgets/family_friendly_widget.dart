import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/enums.dart';
import 'package:movie_software/widgets/buttons/btn_outlined_widdget.dart';

class FamilyFriendlyWidget extends StatelessWidget {
  const FamilyFriendlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      color: context.colors.primary,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text("Family-friendly streaming", style: context.styles.onPrimaryS(30)),
            SizedBox(height: 40),
            AutoSizeText(
              "create kids profile, set parental control, and choose rating levels. Easily findnew favvrites by srting by characters and using age filters.",
              style: context.styles.onPrimaryS(15),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Expanded(
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
