import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';

class AppButtonExternalAccountWidget extends StatelessWidget {
  final String icon;
  final String text;
  final Function()? onPressed;

  const AppButtonExternalAccountWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 36,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset('assets/icons/$icon'),
            ),
            const SizedBox(width: 8),
            Text(
              'Sign in with $text',
              style: AppTextStyles.buttonExternalAccount,
            ),
          ],
        ),
      ),
    );
  }
}
