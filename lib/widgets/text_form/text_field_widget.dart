import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

import '../../styles/color/app_color.dart';
import '../../styles/theme/textfied_inline_decoration.dart';
import 'text_field_controller.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.readOnly = false,
    this.isInlineTextField = false,
    this.obscureToggle = false,
    this.isObscured,
    this.rightIcon,
    this.leftIcon,
    this.onChanged,
    this.listValidator,
  });

  final TextFieldController? controller;
  final String? hintText;
  final bool readOnly;
  final Icon? rightIcon;
  final Icon? leftIcon;
  final bool? isObscured;
  final bool isInlineTextField;
  final bool obscureToggle;
  final Function(String)? onChanged;
  final List<String?> Function(String?)? listValidator;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late TextFieldController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextFieldController();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.readOnly,
      child: ListenableBuilder(
        listenable: controller,
        builder: (_, _) => Theme(
          data: getTheme(),
          child: TextFormField(
            key: controller.fieldKey,
            focusNode: getFocusNode(),
            controller: controller.textController,
            readOnly: widget.readOnly,
            obscureText: widget.isObscured ?? controller.obscureText.value,
            cursorColor: context.colors.onSurface,
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
              prefixIcon: getPrefixIcon(widget.leftIcon),
              prefixIconColor: getColor(),
              suffixIcon: getIcon(widget.rightIcon),
              suffixIconColor: getColor(),
              enabledBorder: getEnableBorder(context),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder? getEnableBorder(BuildContext context) {
    return widget.readOnly
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: widget.readOnly ? context.colors.outline.withOpacity(0.5) : context.colors.onSurface,
              width: 1.4,
            ),
          )
        : null;
  }

  FocusNode? getFocusNode() => widget.readOnly ? null : controller.focusNode;

  TextStyle getLabelStyle() {
    final hasFocus = controller.focusNode.hasFocus;
    final hasError = controller.hasError;

    if (hasFocus && hasError) return context.styles.error.copyWith(color: AppColors.errorLight);
    if (hasError) return context.styles.error;
    if (hasFocus) return context.styles.onSurface;
    return context.styles.gray;
  }

  Color getColor() {
    final hasFocus = controller.focusNode.hasFocus;
    final hasError = controller.hasError;

    if (hasFocus && hasError) return AppColors.errorLight;
    if (hasError) return context.colors.error;
    if (hasFocus) return context.colors.onSurface;
    return context.colors.onSurface;
  }

  Widget? getPrefixIcon(Icon? icon) {
    if (icon == null) return null;
    return Icon(icon.icon, color: getColor());
  }

  Widget? getIcon(Icon? icon) {
    if (widget.obscureToggle) {
      return IconButton(
        icon: Icon(
          controller.obscureText.value ? Icons.visibility_off : Icons.visibility,
          color: getColor(),
        ),
        onPressed: controller.toggleObscureText,
      );
    }

    return getPrefixIcon(icon);
  }

  ThemeData getTheme() {
    if (widget.isInlineTextField) {
      bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
      return Theme.of(context).copyWith(
        inputDecorationTheme: isDarkTheme ? inputDecorationThemeInlineDark : inputDecorationThemeInlineLight,
      );
    }
    return Theme.of(context); //default
  }
}
