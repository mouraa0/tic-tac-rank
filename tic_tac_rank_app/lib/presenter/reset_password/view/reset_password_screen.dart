import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/widgets/buttons/app_button_big_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/text_span/forms_text_span_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/title/forms_title_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/textfield/text_field_widget.dart';
import 'package:tic_tac_rank_app/presenter/reset_password/controller/reset_password_controller.dart';

final _controller = Get.find<ResetPasswordController>();

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                const AppFormsTitleWidget(
                  subtitle: [
                    "Type your registered email",
                    " to receive instructions."
                  ],
                ),
                const Spacer(flex: 2),
                const _TextFieldAreaComponent(),
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
          const SizedBox(height: 20),
          AppButtonBigWidget(
            onPressed: _controller.isButtonActive.value
                ? () => _controller.resetPassword()
                : null,
            title: 'register',
            isLoading: _controller.isButtonLoading.value,
          ),
        ],
      ),
    );
  }
}
