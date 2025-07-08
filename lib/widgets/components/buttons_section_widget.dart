import 'package:flutter/material.dart';

import '../../utils/enums.dart';
import 'buttons/btn_filled_widdget.dart';

class ButtonsSectionWidget extends StatelessWidget {
  const ButtonsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Outlined Button default"),
        SizedBox(height: 10),
        BtnFilledWiddget(
          onPressed: () {},
          text: 'Filled Button S',
          btnSize: BtnSize.s,
        ),
        SizedBox(height: 10),
        BtnFilledWiddget(
          onPressed: () {},
          text: 'Filled Button M',
          btnSize: BtnSize.m,
        ),
        SizedBox(height: 10),
        BtnFilledWiddget(
          onPressed: () {},
          text: 'Filled Button L',
          btnSize: BtnSize.l,
        ),
        SizedBox(height: 10),
        BtnFilledWiddget(
          onPressed: () {},
          text: 'Filled M Icon',
          btnSize: BtnSize.m,
          icon: Icon(Icons.chevron_right),
        ),
        SizedBox(height: 10),
        BtnFilledWiddget(
          onPressed: () {},
          text: 'Rounded M',
          btnSize: BtnSize.m,
          isRounded: true,
        ),
        SizedBox(height: 10),
        BtnFilledWiddget(
          onPressed: () {},
          icon: Icon(Icons.chevron_right),
          text: 'Rounded M icon',
          btnSize: BtnSize.m,
          isRounded: true,
        ),
      ],
    );
  }
}