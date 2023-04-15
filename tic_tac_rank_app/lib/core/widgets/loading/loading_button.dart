import 'package:flutter/material.dart';

class AppLoadingForButtonWidget extends StatelessWidget {
  final double size;
  final Color color;

  const AppLoadingForButtonWidget({
    super.key,
    this.size = 24,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(color: color),
    );
  }
}
