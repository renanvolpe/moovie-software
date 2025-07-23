import 'package:flutter/material.dart';

import '../../../widgets/buttons/switch_widget.dart';

class SwitchSectionWidget extends StatelessWidget {
  const SwitchSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Switch(value: false, onChanged: (v) {}),
        SwitchWidget(
          width: 150,
          value: true,
          onChanged: (v) {},
          left: Icon(Icons.sunny),
          right: Icon(Icons.nightlight_round),
        ),
        SwitchWidget(
          width: 150,
          value: true,
          onChanged: (v) {},
          left: Text("Switch"),
          right: Text("Text"),
        ),
      ],
    );
  }
}