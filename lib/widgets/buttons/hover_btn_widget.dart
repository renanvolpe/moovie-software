import 'package:flutter/material.dart';

class HoverTapWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Function(bool hovering) onHover;

  const HoverTapWidget({
    super.key,
    required this.child,
    this.onTap,
    required this.onHover,
  });

  @override
  State<HoverTapWidget> createState() => _HoverTapWidgetState();
}

class _HoverTapWidgetState extends State<HoverTapWidget> {


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => widget.onHover(true),
      onExit: (_) => widget.onHover(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: SelectionContainer.disabled(
          child: widget.child,
        ),
      ),
    );
  }
}
