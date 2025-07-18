import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../utils/enums.dart';
import '../../utils/form_validators.dart';
import '../buttons/btn_filled_widdget.dart';
import '../text_form/text_field_controller.dart';
import '../text_form/text_field_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var widthField = constraints.maxWidth * 0.75;
        return Column(
          spacing: 15,
          children: [
            TextFieldWidget(
              width: widthField,
              controller: TextFieldController(),
              hintText: 'Login',
              rightIcon: Icon(Icons.person),
              listValidator: (text) => [
                FormValidator.required(text, fieldName: 'Login'),
              ],
            ),
            TextFieldWidget(
              width: widthField,
              controller: TextFieldController(),
              obscureToggle: true,
              hintText: 'Password',
              listValidator: (text) => [
                FormValidator.required(text, fieldName: 'Password'),
                FormValidator.minLength(text, 3),
              ],
            ),
            SizedBox(height: 20),
            Text("Forgot password?", style: context.styles.onSurface),
            SizedBox(height: 20),
            BtnFilledWiddget(
              text: "LOGIN",
              onPressed: () {},
              btnSize: BtnSize.s,
            ),
          ],
        );
      },
    );
  }
}
