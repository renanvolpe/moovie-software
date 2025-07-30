import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../components/btn_underline_widget.dart';
import '../../controllers/layout_summary_controller.dart';
import 'widgets/buttons_section_widget.dart';
import 'widgets/colors_section_widget.dart';
import 'widgets/switch_section_widget.dart';
import 'widgets/text_field_sections_widget.dart';
import 'widgets/texts_section_widget.dart';

class LayoutSummary extends StatefulWidget {
  const LayoutSummary({super.key});

  @override
  State<LayoutSummary> createState() => _LayoutSummaryState();
}

class _LayoutSummaryState extends State<LayoutSummary> {
  var controller = LayoutSummaryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.colors.onSurfaceVariant,
      extendBodyBehindAppBar: true,
      appBar: AppbarCustom(),
      body: SingleChildScrollView(
        child: ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 20,
                  children: [
                    SizedBox(height: kToolbarHeight),
                    Container(
                      color: context.colors.onSurface,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 0; i < controller.listTitles.length; i++)
                            BtnUnderlineWidget(
                              isSelected: controller.title.value == controller.listTitles[i],
                              text: controller.listTitles[i],
                              onTap: () => controller.setTitle(controller.listTitles[i]),
                            ),
                        ],
                      ),
                    ),
                    if (controller.title.value == controller.listTitles[0]) ButtonsSectionWidget(),
                    if (controller.title.value == controller.listTitles[1]) TextComponentsWidget(),
                    if (controller.title.value == controller.listTitles[2]) TextFieldSectionsWidget(),
                    if (controller.title.value == controller.listTitles[3]) ColorsSectionWidget(),
                    if (controller.title.value == controller.listTitles[4]) SwitchSectionWidget(),

                    SizedBox(height: 80),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text("Appbar example"));
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
