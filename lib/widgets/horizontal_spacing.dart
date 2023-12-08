import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing(
    this.width, {
    super.key,
    this.visible = true,
  });

  final double width;
  final bool visible;

  @override
  Widget build(BuildContext context) =>
      Visibility(visible: visible, child: SizedBox(width: width));
}
