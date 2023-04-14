import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/widgets/buttons/app_button_external_account_widget.dart';

class AppFormsExternalAccountsOptionsWidget extends StatelessWidget {
  final bool isLogin;

  const AppFormsExternalAccountsOptionsWidget({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButtonExternalAccountWidget(
          icon: 'google_logo_icon.svg',
          text: 'Google',
          isLogin: isLogin,
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        AppButtonExternalAccountWidget(
          icon: 'apple_logo_icon.svg',
          text: 'Apple',
          isLogin: isLogin,
          onPressed: () {},
        ),
      ],
    );
  }
}
