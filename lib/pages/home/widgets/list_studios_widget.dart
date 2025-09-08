import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../utils/app_utils.dart';
import '../../../utils/hoverable_mixin.dart';
import '../../../widgets/buttons/hover_btn_widget.dart';

class ListStudiosWidget extends StatelessWidget {
  const ListStudiosWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      width: width < AppUtils.widthMobile ? width * 0.9 : width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Studios", style: context.styles.onPrimaryS(30)),
          SizedBox(height: 35),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 30,
            runSpacing: 25,
            children: [
              for (int i = 1; i < 11; i++) StudioWidget(path: 'assets/studio-$i.png'),
            ],
          ),
        ],
      ),
    );
  }
}

class StudioWidget extends StatefulWidget {
  const StudioWidget({
    super.key,
    required this.path,
    this.size = 100,
  });

  final String path;
  final double size;

  @override
  State<StudioWidget> createState() => _StudioWidgetState();
}

class _StudioWidgetState extends State<StudioWidget> with HoverableMixin {
  @override
  Widget build(BuildContext context) {
    return HoverTapWidget(
      onHover: handleHover,
      child: AnimatedContainer(
        duration: AppUtils.fast,
        width: widget.size,
        height: widget.size,
        padding: isHovered ? EdgeInsets.zero : EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.colors.onPrimaryColor,
          borderRadius: AppUtils.borderRadiusL,
        ),
        child: Image.asset(
          widget.path,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
