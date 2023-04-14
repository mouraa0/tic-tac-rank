import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';
import 'package:tic_tac_rank_app/core/widgets/buttons/app_button_big_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/forms_title/forms_title_widget.dart';
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
            children: const [
              Spacer(flex: 1),
              AppFormsTitleWidget(
                title: 'LOGIN',
                subtitle: 'Enter your credentials to continue.',
              ),
              Spacer(flex: 2),
              _TextFieldAreaComponent(),
              SizedBox(height: 20),
              _DividerComponent(),
              SizedBox(height: 20),
              OtherOptionsComponent(),
              Spacer(flex: 1),
              _DontHaveAccountComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DontHaveAccountComponent extends StatelessWidget {
  const _DontHaveAccountComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Don't Have an Account? ",
        style: AppTextStyles.textSpan,
        children: [
          TextSpan(
            text: 'Register now!',
            style: AppTextStyles.textSpanButton,
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.offAndToNamed(AppRouter.registerScreen),
          ),
        ],
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
