import 'package:flutter/material.dart';
import 'package:movie_software/styles/color/app_color.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/hoverable_mixin.dart';
import 'package:movie_software/widgets/buttons/hover_btn_widget.dart';

import '../../../components/btn_see_more_widget.dart';
import '../../../models/watch_moddel.dart';
import '../../../utils/app_animation.dart';

class ContinueWatchingWidget extends StatelessWidget {
  const ContinueWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text("Continue Watching", style: context.styles.onPrimaryS(22)),
                Spacer(),
                BtnSeeMoreWidget(
                  onTap: () {},
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
                    itemCount: mockWatchModel.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return WatchFilmWidget(
                        width: width,
                        watchModel: mockWatchModel[index],
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

class WatchFilmWidget extends StatefulWidget {
  const WatchFilmWidget({
    super.key,
    required this.width,
    required this.watchModel,
  });

  final double width;
  final WatchModel watchModel;

  @override
  State<WatchFilmWidget> createState() => _WatchFilmWidgetState();
}

class _WatchFilmWidgetState extends State<WatchFilmWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return HoverTapWidget(
      onHover: handleHover,
      child: Container(
        width: widget.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: AppUtils.borderRadiusM,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                widget.watchModel.path,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: isHovered ? 0.6 : 0,
                duration: AppUtils.fast,
                curve: Curves.easeInOut,
                child: Container(
                  color: Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: isHovered ? AppColors.alertDark : AppColors.alert,
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: context.colors.onPrimaryColor,
                  size: 45,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Container(
                  child: Text(
                    widget.watchModel.name,
                    style: context.styles.onPrimaryS(18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
