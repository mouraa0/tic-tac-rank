import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';
import 'package:tic_tac_rank_app/core/widgets/buttons/app_button_big_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/divider/forms_divider_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/text_span/forms_text_span_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms/title/forms_title_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/textfield/text_field_widget.dart';
import 'package:tic_tac_rank_app/presenter/login/view/components/other_options_component.dart';

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
            children: [
              const Spacer(flex: 1),
              const AppFormsTitleWidget(
                title: 'LOGIN',
                subtitle: 'Enter your credentials to continue.',
              ),
              const Spacer(flex: 2),
              const _TextFieldAreaComponent(),
              const SizedBox(height: 20),
              const AppFormsDividerWidget(),
              const SizedBox(height: 20),
              const OtherOptionsComponent(),
              const Spacer(flex: 1),
              AppFormsTextSpanWidget(
                infoText: "Don't Have an Account? ",
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

class _DividerComponent extends StatelessWidget {
  const _DividerComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.grey)),
        const SizedBox(width: 10),
        Text('or', style: AppTextStyles.details),
        const SizedBox(width: 10),
        const Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}
