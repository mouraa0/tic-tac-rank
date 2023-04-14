import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';

class AppFormsTextSpanWidget extends StatelessWidget {
  final String infoText;
  final String clickableText;
  final Function()? onTap;

  const AppFormsTextSpanWidget({
    Key? key,
    required this.infoText,
    required this.clickableText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: infoText,
        style: AppTextStyles.textSpan,
        children: [
          TextSpan(
            text: clickableText,
            style: AppTextStyles.textSpanButton,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
