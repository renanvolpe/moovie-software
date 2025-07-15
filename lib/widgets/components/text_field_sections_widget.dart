
import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../utils/form_validators.dart';
import '../text_form/text_field_controller.dart';
import '../text_form/text_field_widget.dart';
final formKey = GlobalKey<FormState>();

class TextFieldSectionsWidget extends StatefulWidget {
  const TextFieldSectionsWidget({super.key});

  @override
  State<TextFieldSectionsWidget> createState() => _TextFieldSectionsWidgetState();
}

class _TextFieldSectionsWidgetState extends State<TextFieldSectionsWidget> {
  final controllerTest = TextFieldController();
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
            TextField(
              decoration: InputDecoration(hintText: "With nothing"),
            ),
            TextFormFieldWidget(
              controller: controllerTest,
              hintText: 'With Validator Field',
              listValidator: (text) => [
                Validator.required(text, fieldName: 'Validator Field'),
              ],
            ),
            TextFormFieldWidget(
              controller: TextFieldController(),
              hintText: 'With Left Icon',
              leftIcon: Icon(Icons.search),
            ),
            TextFormFieldWidget(
              controller: TextFieldController(),
              hintText: 'With Right Icon and Validators',
              rightIcon: Icon(Icons.remove_red_eye_outlined),
              listValidator: (text) => [
                Validator.required(text, fieldName: 'fieldName'),
                Validator.minLength(text, 5),
              ],
            ),

            TextFormFieldWidget(
              controller: TextFieldController(),
              hintText: 'With Obscure text and Validator',
              rightIcon: Icon(Icons.remove_red_eye_outlined),
              obscureToggle: true,
              listValidator: (text) => [
                Validator.required(text, fieldName: 'Obscure'),
                Validator.minLength(text, 5),
              ],
            ),

            TextFormFieldWidget(
              readOnly: true,
              controller: TextFieldController(),
              hintText: 'Read only',
            ),

            TextFormFieldWidget(
              controller: TextFieldController(),
              hintText: 'Inline text and Validator',
              isInlineTextField: true,
              listValidator: (text) => [
                Validator.minLength(text, 5),
              ],
            ),

            TextFormFieldWidget(
              controller: TextFieldController(),
              hintText: 'Inline text',
              isInlineTextField: true,
              listValidator: (text) => [
                Validator.minLength(text, 5),
              ],
            ),

            TextFormFieldWidget(
              controller: TextFieldController(),
              hintText: 'Inline text obscure',
              isInlineTextField: true,
              isObscured: true,
              listValidator: (text) => [
                Validator.minLength(text, 5),
              ],
            ),

            TextButton(
              onPressed: () {
                formKey.currentState?.validate();
                print("controllerTest.text:${controllerTest.text}");
              },
              child: Text("Validate"),
            ),
          ],
        ),
      ),
    );
  }
}