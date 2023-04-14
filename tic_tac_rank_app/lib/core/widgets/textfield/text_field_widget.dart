import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';

class AppTextFieldWidget extends StatelessWidget {
  final String label;

  const AppTextFieldWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        floatingLabelStyle: AppTextStyles.inputLabel,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
