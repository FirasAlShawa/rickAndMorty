import 'package:flutter/material.dart';

part 'rk_text_style.dart';

class RkText extends StatelessWidget {
  final String text;
  final TextStyle _style;
  final TextOverflow? textOverflow;
  final Color? color;

  RkText.smallBoldLabel(
    this.text, {
    super.key,
    this.color,
    this.textOverflow,
  }) : _style = _smallBoldLabel.copyWith(
          color: color ?? Colors.black,
          overflow: textOverflow ?? TextOverflow.ellipsis,
        );

  RkText.xSmallBoldLabel(
    this.text, {
    this.color,
    this.textOverflow,
    super.key,
  }) : _style = _xSmallBoldLabel.copyWith(
          color: color ?? const Color(0xff1A1C1F),
          overflow: textOverflow ?? TextOverflow.ellipsis,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _style,
    );
  }
}
