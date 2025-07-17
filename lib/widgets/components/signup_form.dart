
import 'package:flutter/material.dart';

import '../../utils/form_validators.dart';
import '../text_form/text_field_controller.dart';
import '../text_form/text_field_widget.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var widthField = constraints.maxWidth * 0.75;
        return Column(
          spacing: 10,
          children: [
            TextFieldWidget(
              width: widthField,
              controller: TextFieldController(),
              hintText: 'Full Name',
              listValidator: (text) => [
                FormValidator.required(text, fieldName: 'Full Name'),
              ],
            ),

            TextFieldWidget(
              width: widthField,
              controller: TextFieldController(),
              hintText: 'E-Mail',
              rightIcon: Icon(Icons.email),
              listValidator: (text) => [
                FormValidator.required(text, fieldName: 'E-Mail'),
              ],
            ),
            TextFieldWidget(
              width: widthField,
              controller: TextFieldController(),
              hintText: 'Password',
              obscureToggle: true,
              listValidator: (text) => [
                FormValidator.required(text, fieldName: 'Password'),
              ],
            ),
            TextFieldWidget(
              width: widthField,
              controller: TextFieldController(),
              hintText: 'Username',
              listValidator: (text) => [
                FormValidator.required(text, fieldName: 'Username'),
              ],
            ),
            FilledButton(onPressed: () {}, child: Text("CONFIRM")),
          ],
        );
      },
    );
  }
}
