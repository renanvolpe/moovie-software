import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget left;
  final Widget right;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.left,
    required this.right,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> with SingleTickerProviderStateMixin {
  bool _value = false;
  double _dragPosition = 0;

  final GlobalKey _leftKey = GlobalKey();
  final GlobalKey _rightKey = GlobalKey();
  final animationDuration = const Duration(milliseconds: 200);
  final double height = 40;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
    _dragPosition = _value ? 1.0 : 0.0;
  }

  void _onTap() {
    final newValue = !_value;
    _animateTo(newValue ? 1.0 : 0.0);
    widget.onChanged(newValue);
  }

  void _onDragUpdate(DragUpdateDetails details, double maxWidth) {
    final localDx = details.localPosition.dx.clamp(0.0, maxWidth);
    final dragRatio = (localDx / maxWidth).clamp(0.0, 1.0);
    setState(() {
      _dragPosition = dragRatio;
    });
  }

  void _onDragEnd() {
    final newValue = _dragPosition >= 0.5;
    _animateTo(newValue ? 1.0 : 0.0);
    widget.onChanged(newValue);
  }

  void _animateTo(double target) {
    setState(() {
      _value = target == 1.0;
      _dragPosition = target;
    });
  }

  double _getWidgetWidth(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return height;
    final box = context.findRenderObject() as RenderBox;
    return box.size.width;
  }

  @override
  void didUpdateWidget(CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _animateTo(widget.value ? 1.0 : 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final totalWidth = constraints.maxWidth;
            final bool isInLeft = _dragPosition < 0.5;

            final leftColor = isInLeft ? context.colors.onPrimaryColor : context.colors.onSurface.withOpacity(0.5);
            final rightColor = !isInLeft ? context.colors.onPrimaryColor : context.colors.onSurface.withOpacity(0.5);

            final leftWidth = _getWidgetWidth(_leftKey) + 6;
            final rightWidth = _getWidgetWidth(_rightKey) + 6;

            final thumbWidth = (isInLeft) ? leftWidth : rightWidth;
            final thumbOffset = (isInLeft) ? 4.0 : totalWidth - leftWidth - 6;

            return GestureDetector(
              onTap: _onTap,
              onHorizontalDragUpdate: (d) => _onDragUpdate(d, totalWidth),
              onHorizontalDragEnd: (_) => _onDragEnd(),
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: context.colors.surface,
                  borderRadius: BorderRadius.circular(height),
                  border: Border.all(color: context.colors.primary.withOpacity(0.6), width: 1.4),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Thumb
                    AnimatedPositioned(
                      duration: animationDuration,
                      curve: Curves.easeOut,
                      left: thumbOffset,
                      child: Container(
                        width: thumbWidth,
                        height: height - 8,
                        decoration: BoxDecoration(
                          color: context.colors.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),

                    // Content
                    Row(
                      children: [
                        Expanded(
                          key: _leftKey,
                          child: MouseRegion(
                            child: Center(
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  color: leftColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                child: Container(
                                  child: widget.left,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          key: _rightKey,
                          child: MouseRegion(
                            child: Center(
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  color: rightColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                child: Container(
                                  child: widget.right,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
