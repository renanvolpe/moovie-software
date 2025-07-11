import 'package:flutter/material.dart';

mixin HoverableMixin<T extends StatefulWidget> on State<T> {
  bool _isHovered = false;

  bool get isHovered => _isHovered;

  void handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
