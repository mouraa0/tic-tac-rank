import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/widgets/buttons/app_button_big_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/divider/forms_divider_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/external_accounts_options/forms_external_accounts_options_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/text_span/forms_text_span_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/title/forms_title_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/textfield/text_field_widget.dart';
import 'package:tic_tac_rank_app/presenter/register/controller/register_controller.dart';

final _controller = Get.find<RegisterController>();

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                title: 'Register',
                subtitle: ["Create a new account", " to access the app."],
              ),
              const Spacer(flex: 2),
              const _TextFieldAreaComponent(),
              const SizedBox(height: 20),
              const AppFormsDividerWidget(),
              const SizedBox(height: 20),
              const AppFormsExternalAccountsOptionsWidget(isLogin: false),
              const Spacer(flex: 1),
              AppFormsTextSpanWidget(
                infoText: "Already have an account? ",
                clickableText: 'Login!',
                onTap: () => Get.offAndToNamed(AppRouter.loginScreen),
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
    return Obx(
      () => Column(
        children: [
          AppTextFieldWidget(
            label: 'email',
            onChanged: (str) => _controller.onChangedEmail(str),
            errorText: _controller.emailErrorText.value,
          ),
          const SizedBox(height: 10),
          AppTextFieldWidget(
            label: 'username',
            onChanged: (str) => _controller.onChangedUsername(str),
            errorText: _controller.usernameErrorText.value,
          ),
          const SizedBox(height: 10),
          AppTextFieldWidget(
            label: 'password',
            onChanged: (str) => _controller.onChangedPassword(str),
            errorText: _controller.passwordErrorText.value,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          AppButtonBigWidget(
            onPressed: _controller.isRegisterButtonActive.value
                ? () => _controller.register()
                : null,
            title: 'register',
            isLoading: _controller.isRegisterButtonLoading.value,
          ),
        ],
      ),
    );
  }
}
