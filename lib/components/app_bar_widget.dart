import 'package:flutter/material.dart';
import 'package:movie_software/components/btn_underline_widget.dart';
import 'package:movie_software/components/logo_widget.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/app_animation.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 45, right: 45),
        child: Center(
          child: AppBar(
            toolbarHeight: kToolbarHeight + 10,
            elevation: 0,
            actionsPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: AppUtils.borderRadiusM,
              side: BorderSide(color: context.colors.primary, width: 0.3),
            ),
            leading: LogoWidget(),
            centerTitle: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < 5; i++)
                      BtnUnderlineWidget(
                        text: "asd $i",
                        onTap: () {},
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
