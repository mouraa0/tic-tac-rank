import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/widgets/buttons/app_button_big_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/text_span/forms_text_span_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/title/forms_title_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/textfield/text_field_widget.dart';
import 'package:tic_tac_rank_app/presenter/register/controller/create_username_controller.dart';
import 'package:tic_tac_rank_app/presenter/register/controller/register_controller.dart';

final _controller = Get.find<CreateUsernameController>();

class CreateUsernameScreen extends StatelessWidget {
  const CreateUsernameScreen({super.key});

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
                    "Create a username",
                    " so everyone knows who you are.",
                  ],
                ),
                const SizedBox(height: 20),
                const AppFormsTitleWidget(
                  showLogo: false,
                  subtitle: [
                    "",
                    "Must be between 3 and 14 characters long, and you can change it later.",
                  ],
                ),
                const Spacer(flex: 2),
                const _TextFieldAreaComponent(),
                const SizedBox(height: 20),
                const Spacer(flex: 1),
                AppFormsTextSpanWidget(
                  infoText: "",
                  clickableText: 'Login with another account',
                  onTap: () => Get.offAndToNamed(AppRouter.loginScreen),
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
            label: 'username',
            onChanged: (str) => _controller.onChangedUsername(str),
            errorText: _controller.usernameErrorText.value,
          ),
          const SizedBox(height: 20),
          AppButtonBigWidget(
            onPressed: _controller.isButtonActive.value
                ? () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _controller.addUsername();
                  }
                : null,
            title: 'continue',
            isLoading: _controller.isButtonLoading.value,
          ),
        ],
      ),
    );
  }
}
