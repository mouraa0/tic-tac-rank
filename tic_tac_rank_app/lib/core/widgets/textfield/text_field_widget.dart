import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';

class AppTextFieldWidget extends StatelessWidget {
  final String label;
  final Function(String)? onChanged;
  final String? errorText;
  final bool obscureText;

  const AppTextFieldWidget({
    Key? key,
    required this.label,
    this.onChanged,
    this.errorText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        errorText: errorText,
        labelText: label,
        floatingLabelStyle: AppTextStyles.inputLabel,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
