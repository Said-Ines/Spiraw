import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing(
    this.height, {
    super.key,
    this.visible = true,
  });

  final double height;
  final bool visible;

  @override
  Widget build(BuildContext context) =>
      Visibility(visible: visible, child: SizedBox(height: height));
}
