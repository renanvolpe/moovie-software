import 'package:flutter/material.dart';
import 'package:movie_software/styles/context_style.dart';

class SwitchWidget extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget left;
  final Widget right;
  final double? width;

  const SwitchWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.left,
    required this.right,
    this.width,
  });

  @override
  State<SwitchWidget> createState() => SwitchStateWidget();
}

class SwitchStateWidget extends State<SwitchWidget> with SingleTickerProviderStateMixin {
  bool _value = false;
  double _dragPosition = 0;

  final GlobalKey _leftKey = GlobalKey();
  final GlobalKey _rightKey = GlobalKey();
  final animationDuration = const Duration(milliseconds: 200);
  final double height = 40;

  bool isInitalLoaded = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
    _dragPosition = _value ? 1.0 : 0.0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isInitalLoaded = true;
      });
    });
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
    final box = context!.findRenderObject() as RenderBox;
    return box.size.width;
  }

  @override
  void didUpdateWidget(SwitchWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _animateTo(widget.value ? 1.0 : 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: SelectionContainer.disabled(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final totalWidth = constraints.maxWidth;
              final bool isInLeft = _dragPosition < 0.5;
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
                      if (isInitalLoaded)
                        AnimatedPositioned(
                          duration: animationDuration,
                          curve: Curves.easeOut,
                          left: getOffset(isInLeft, totalWidth),
                          child: Container(
                            width: getWidth(isInLeft),
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
                                    color: _getColor(isInLeft, true),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  child: IconTheme(
                                    data: IconThemeData(color: _getColor(isInLeft, true), size: 20),
                                    child: Container(
                                      child: widget.left,
                                    ),
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
                                    color: _getColor(isInLeft, false),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  child: IconTheme(
                                    data: IconThemeData(color: _getColor(isInLeft, false), size: 20),
                                    child: Container(
                                      child: widget.right,
                                    ),
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
      ),
    );
  }

  Color _getColor(bool isInLeft, bool isLeft) {
    if (isLeft) return isInLeft ? context.colors.onPrimaryColor : context.colors.onSurface.withOpacity(0.5);
    return !isInLeft ? context.colors.onPrimaryColor : context.colors.onSurface.withOpacity(0.5);
  }

  double getWidth(bool isInLeft) {
    final leftWidth = _getWidgetWidth(_leftKey) * 0.9;
    final rightWidth = _getWidgetWidth(_rightKey) * 0.9;

    return isInLeft ? leftWidth : rightWidth;
  }

  double getOffset(bool isInLeft, double totalWidth) {
    final context = _rightKey.currentContext;
    final box = context!.findRenderObject() as RenderBox;
    final rightWidth = box.size.width;

    return isInLeft ? 4.0 : totalWidth - rightWidth;
  }
}
