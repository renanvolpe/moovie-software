import 'package:flutter/material.dart';

import '../../../styles/color/app_color.dart';
import '../../../utils/app_space.dart';
import '../../../utils/enums.dart' show BtnSize;

class BtnOutlinedWiddget extends StatelessWidget {
  const BtnOutlinedWiddget({
    super.key,
    required this.onPressed,
    required this.text,
    this.btnSize = BtnSize.free,
    this.isRounded = false,
    this.icon,
  });

  final void Function() onPressed;
  final String text;
  final BtnSize btnSize;
  final bool isRounded;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getSize(),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: isRounded
                  ? OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  : null,
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    SizedBox(width: 4),
                    Icon(icon!.icon, color: AppColors.white, size: icon!.size),
                  ],
                  Text(text, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double? _getSize() {
    switch (btnSize) {
      case BtnSize.free:
        return null;
      case BtnSize.s:
        return AppSpace.btnWidthS;
      case BtnSize.m:
        return AppSpace.btnWidthM;
      case BtnSize.l:
        return AppSpace.btnWidthL;
    }
  }
}
