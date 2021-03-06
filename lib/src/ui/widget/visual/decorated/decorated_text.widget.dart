import 'package:flutter/material.dart';

class DecoratedText extends StatelessWidget {
  const DecoratedText(
    this.data, {
    Key key,
    this.padding,
    this.margin,
    this.decoration,
    this.style = const TextStyle(),
    this.safeArea,
    this.onPressed,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.constraints,
    this.expanded = false,
  }) : super(key: key);

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BoxDecoration decoration;
  final TextStyle style;
  final String data;
  final bool safeArea;
  final ValueChanged<String> onPressed;
  final int maxLines;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final BoxConstraints constraints;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    Widget result = Text(
      data,
      maxLines: maxLines,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
    );

    if (decoration != null || padding != null || margin != null) {
      result = Container(
        margin: margin,
        padding: padding,
        decoration: decoration,
        constraints: constraints,
        child: result,
      );
    }

    if (safeArea != null) {
      result = SafeArea(child: result);
    }

    if (onPressed != null) {
      result = GestureDetector(
        onTap: () => onPressed(data),
        child: result,
      );
    }

    if (expanded) {
      result = Expanded(child: result);
    }

    return result;
  }
}
