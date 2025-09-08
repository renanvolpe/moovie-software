import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_software/components/btn_icon_widget.dart' show BtnIconWidget;
import 'package:movie_software/components/btn_underline_widget.dart';
import 'package:movie_software/components/logo_widget.dart';
import 'package:movie_software/styles/context_style.dart';
import 'package:movie_software/utils/app_utils.dart';
import 'package:movie_software/utils/navigation.dart';
import 'package:movie_software/widgets/buttons/hover_btn_widget.dart';

import 'app_bar_controller.dart';

final heigthAppBar = kToolbarHeight + 10;

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(heigthAppBar + 10);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  var controller = AppBarController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    if (width < AppUtils.widthMobile) {
      return FloatingAppBarButton();
    }
    return Container(
      margin: EdgeInsets.only(top: 15, left: 70, right: 70),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AppBar(
            backgroundColor: context.colors.outline.withOpacity(0.1),
            toolbarHeight: heigthAppBar,
            elevation: 0,
            actionsPadding: EdgeInsets.zero,
            leadingWidth: 150,
            shape: RoundedRectangleBorder(
              borderRadius: AppUtils.borderRadiusM,
              side: BorderSide(color: context.colors.primary, width: 0.3),
            ),
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HoverTapWidget(
                  onHover: (_) {},
                  onTap: () => Navigator.pushNamed(context, AppRoutes.home),
                  child: LogoWidget(size: heigthAppBar),
                ),
              ],
            ),
            centerTitle: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListenableBuilder(
                  listenable: controller,
                  builder: (context, child) {
                    return Row(
                      spacing: 15,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: controller
                          .getMenuItems()
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: BtnUnderlineWidget(
                                text: item.label,
                                isSelected: controller.menuItemSelected == item,
                                onTap: () {
                                  controller.selectMenu(item);
                                  item.onTap();
                                },
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ],
            ),
            actions: [ListIconActionWidget()],
          ),
        ),
      ),
    );
  }
}

class ListIconActionWidget extends StatelessWidget {
  const ListIconActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        spacing: 15,
        children: [
          BtnIconWidget(
            onTap: () {},
            icon: Icon(
              Icons.search,
              color: context.colors.onPrimaryColor,
              size: 27,
            ),
          ),
          BtnIconWidget(
            onTap: () {},
            icon: Icon(
              Icons.notifications,
              color: context.colors.onPrimaryColor,
              size: 27,
            ),
          ),
          BtnIconWidget(
            onTap: () {},
            icon: Icon(
              Icons.person,
              color: context.colors.onPrimaryColor,
              size: 27,
            ),
          ),
          BtnIconWidget(
            onTap: () {},
            icon: Icon(
              Icons.sunny,
              color: context.colors.onPrimaryColor,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }
}

class IconHomeWidget extends StatelessWidget {
  const IconHomeWidget({super.key, required this.iconData});
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        color: context.colors.onPrimaryColor,
        size: 27,
      ),
      onPressed: () {},
    );
  }
}

class FloatingAppBarButton extends StatelessWidget {
  const FloatingAppBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: AppUtils.paddingS,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: context.colors.outline.withOpacity(0.1),
              borderRadius: AppUtils.borderRadiusXXL,
              border: Border.all(color: context.colors.primary, width: 0.3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                HoverTapWidget(
                  onHover: (_) {},
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
