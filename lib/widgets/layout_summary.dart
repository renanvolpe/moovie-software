import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../controllers/layout_summary_controller.dart';
import '../utils/form_validators.dart';
import 'components/buttons_section_widget.dart';
import 'components/text_form/text_field_controller.dart';
import 'components/text_form/text_field_widget.dart';
import 'components/texts_section_widget.dart';
import 'login.dart';

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
                            BtnsLogin(
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

final formKey = GlobalKey<FormState>();

class TextFieldSectionsWidget extends StatefulWidget {
  const TextFieldSectionsWidget({super.key});

  @override
  State<TextFieldSectionsWidget> createState() => _TextFieldSectionsWidgetState();
}

class _TextFieldSectionsWidgetState extends State<TextFieldSectionsWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width * 0.7;
    return SizedBox(
      width: width,
      child: Form(
        key: formKey,
        child: Column(
          spacing: 15,
          children: [
            Text(
              "TextField Section examples",
              style: context.styles.blackS(40),
            ),
            TextField(),
            TextFormFieldWidget(
              controller: TextFieldController(),
              hintText: '',
              listValidator: (text) => [
                Validator.required(text, fieldName: 'fieldName'),
              ],
            ),
            TextFormFieldWidget(
              controller: TextFieldController(),
              hintText: 'HintText',
              leftIcon: Icon(Icons.search),
              listValidator: (text) => [
                Validator.required(text, fieldName: 'HintText'),
              ],
            ),
            TextFormFieldWidget(
              controller: TextFieldController(),
              hintText: 'HintText',
              rightIcon: Icon(Icons.remove_red_eye_outlined),
              listValidator: (text) => [
                Validator.required(text, fieldName: 'fieldName'),
                Validator.minLength(text, 5),
              ],
            ),

            TextButton(
              onPressed: () {
                formKey.currentState?.validate();
              },
              child: Text("Validate"),
            ),
          ],
        ),
      ),
    );
  }
}
