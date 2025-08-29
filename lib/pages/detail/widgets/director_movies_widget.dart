import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../models/mock/profile_mock.dart';
import '../../profile/widgets/avatar_person_widget.dart';

class DirectorsMoviesWidget extends StatelessWidget {
  const DirectorsMoviesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text("Directors", style: context.styles.onPrimaryS(40)),
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
                    itemCount: 2,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return AvatarPersonWidget(
                        profileModel: listProfilesMock.reversed.toList()[index],
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
