import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../models/mock/profile_mock.dart';
import '../../profile/widgets/avatar_person_widget.dart';

class CharactorsMoviesWidget extends StatelessWidget {
  const CharactorsMoviesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text("Charactors", style: context.styles.onPrimaryS(40)),
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
