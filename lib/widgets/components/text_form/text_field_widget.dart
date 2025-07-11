import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../../styles/color/app_color.dart';
import 'text_field_controller.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.readOnly = false,
    this.isInlineTextField = false,
    this.obscureText = false,
    this.rightIcon,
    this.leftIcon,
    this.onChanged,
    this.listValidator,
  });

  final String hintText;
  final TextFieldController controller;
  final bool readOnly;
  final Icon? rightIcon;
  final Icon? leftIcon;
  final bool isInlineTextField;
  final bool obscureText;
  final Function(String)? onChanged;
  final List<String?> Function(String?)? listValidator;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerUpdate);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerUpdate);
    super.dispose();
  }

  void _onControllerUpdate() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.controller.fieldKey,
      focusNode: widget.controller.focusNode,
      controller: widget.controller.textController,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      cursorColor: AppColors.black,
      validator: (value) {
        final validators = widget.listValidator?.call(value ?? '') ?? [];
        for (final error in validators) {
          if (error != null) return error;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.hintText,
        labelStyle: getLabelStyle(),
        prefixIcon: widget.leftIcon,
        prefixIconColor: getColor(),
        suffixIcon: widget.rightIcon,
        suffixIconColor: getColor(),
      ),
    );
  }

  TextStyle getLabelStyle() {
    final hasFocus = widget.controller.focusNode.hasFocus;
    final hasError = widget.controller.hasError;

    if (hasFocus && hasError) return context.styles.error.copyWith(color: AppColors.alizarinDarkLight);
    if (hasError) return context.styles.error;
    if (hasFocus) return context.styles.black;
    return context.styles.gray;
  }

  Color getColor() {
    final hasFocus = widget.controller.focusNode.hasFocus;
    final hasError = widget.controller.hasError;

    if (hasFocus && hasError) return AppColors.alizarinDarkLight;
    if (hasError) return context.colors.error;
    if (hasFocus) return context.colors.onBackground;
    return context.colors.onTertiaryColor;
  }
}
