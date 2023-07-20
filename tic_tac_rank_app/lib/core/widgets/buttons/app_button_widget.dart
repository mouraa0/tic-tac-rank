import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isExpanded;

  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isExpanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.black),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
