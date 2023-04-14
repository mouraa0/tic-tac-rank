import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';

class AppButtonBigWidget extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Function()? onPressed;

  const AppButtonBigWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(title, style: AppTextStyles.buttonBig),
      ),
    );
  }
}
