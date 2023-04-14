import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/widgets/buttons/app_button_big_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/divider/forms_divider_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/external_accounts_options/forms_external_accounts_options_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/text_span/forms_text_span_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/title/forms_title_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/textfield/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              const AppFormsTitleWidget(
                title: 'Login',
                subtitle: ['Enter your credentials', ' to continue.'],
              ),
              const Spacer(flex: 2),
              const _TextFieldAreaComponent(),
              const SizedBox(height: 20),
              const AppFormsDividerWidget(),
              const SizedBox(height: 20),
              const AppFormsExternalAccountsOptionsWidget(isLogin: true),
              const Spacer(flex: 1),
              AppFormsTextSpanWidget(
                infoText: "Don't have an account? ",
                clickableText: 'Register now!',
                onTap: () => Get.offAndToNamed(AppRouter.registerScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextFieldAreaComponent extends StatelessWidget {
  const _TextFieldAreaComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppTextFieldWidget(label: 'username or email'),
        SizedBox(height: 10),
        AppTextFieldWidget(label: 'password'),
        SizedBox(height: 20),
        AppButtonBigWidget(onPressed: null, title: 'login'),
      ],
    );
  }
}
