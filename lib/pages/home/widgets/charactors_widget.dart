import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../models/mock/profile_mock.dart';
import '../../../widgets/buttons/switch_widget.dart';
import '../../profile/widgets/avatar_person_widget.dart';

class CharactorsWidget extends StatelessWidget {
  const CharactorsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text("Charactors", style: context.styles.onPrimaryS(22)),
                Spacer(),
                SizedBox(
                  width: 180,
                  child: SwitchWidget(
                    value: false,
                    onChanged: (t) {},
                    left: Text("Directors"),
                    right: Text("Authors"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: Row(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: listProfilesMock.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return AvatarPersonWidget(
                        profileModel: listProfilesMock[index],
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
