import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/error/classes/error_info.dart';
import 'package:tic_tac_rank_app/core/global/global.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';
import 'package:tic_tac_rank_app/core/widgets/buttons/app_button_big_widget.dart';

class AppErrorSnackBar extends StatelessWidget {
  final ErrorInfo errorInfo;

  const AppErrorSnackBar({
    super.key,
    required this.errorInfo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Visibility(
            visible: errorInfo.canBeClosed,
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => snackbarKey.currentState?.clearSnackBars(),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            errorInfo.title,
            style: AppTextStyles.errorSnackBarTitle,
          ),
          const SizedBox(height: 10),
          Container(
            height: 150,
            alignment: Alignment.center,
            child: Text(
              errorInfo.msg,
              style: AppTextStyles.errorSnackBarMsg,
            ),
          ),
          const SizedBox(height: 10),
          AppButtonBigWidget(
            title: errorInfo.buttonTitle,
            onPressed: errorInfo.onButtonPressed ??
                () => snackbarKey.currentState?.clearSnackBars(),
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
