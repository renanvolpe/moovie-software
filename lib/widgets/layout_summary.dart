import 'package:flutter/material.dart';

import 'components/buttons_section_widget.dart';
import 'components/texts_section_widget.dart';

class LayoutSummary extends StatefulWidget {
  const LayoutSummary({super.key});

  @override
  State<LayoutSummary> createState() => _LayoutSummaryState();
}

class _LayoutSummaryState extends State<LayoutSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppbarCustom(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              ButtonsSectionWidget(),
              Text("Appbar"),
              TextComponentsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text("widget.title"));
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
