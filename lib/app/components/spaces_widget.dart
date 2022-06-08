import 'package:flutter/material.dart';

// horizontal space
class HorizontalSpace extends StatelessWidget {
  final double width;
  // ignore: use_key_in_widget_constructors
  const HorizontalSpace([this.width = 8.0]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

// vertical space
class VerticalSpace extends StatelessWidget {
  final double height;
  // ignore: use_key_in_widget_constructors
  const VerticalSpace([this.height = 8.0]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
