import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../utils/enums.dart';
import '../../../widgets/buttons/btn_filled_widdget.dart';
import '../../../widgets/buttons/btn_outlined_widdget.dart';

class ButtonsSectionWidget extends StatelessWidget {
  const ButtonsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text(
          "Filled Section examples",
        style: context.styles.blackS(40),
        ),

        BtnFilledWiddget(
          onPressed: () {},
          text: 'Filled Button Free',
        ),

        BtnFilledWiddget(
          onPressed: () {},
          text: 'Filled Button S',
          btnSize: BtnSize.s,
        ),

        BtnFilledWiddget(
          onPressed: () {},
          text: 'Filled Button M',
          btnSize: BtnSize.m,
        ),

        BtnFilledWiddget(
          onPressed: () {},
          text: 'Filled Button L',
          btnSize: BtnSize.l,
        ),

        BtnFilledWiddget(
          onPressed: () {},
          text: 'Filled M Icon',
          btnSize: BtnSize.m,
          icon: Icon(Icons.chevron_right),
        ),

        BtnFilledWiddget(
          onPressed: () {},
          text: 'Rounded M',
          btnSize: BtnSize.m,
          isRounded: true,
        ),

        BtnFilledWiddget(
          onPressed: () {},
          icon: Icon(Icons.chevron_right),
          text: 'Rounded M icon',
          btnSize: BtnSize.m,
          isRounded: true,
        ),

        Text("Outline Button default", style: context.styles.primaryS(22)),
        BtnOutlinedWiddget(
          onPressed: () {},
          text: "Outlined Free",
        ),
        BtnOutlinedWiddget(
          onPressed: () {},
          text: "Outlined s",
          btnSize: BtnSize.s,
        ),
      ],
    );
  }
}
