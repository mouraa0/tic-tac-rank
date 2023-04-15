import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/error/classes/error_info.dart';
import 'package:tic_tac_rank_app/core/error/manager/error_manager.dart';
import 'package:tic_tac_rank_app/core/widgets/snack_bars/error_snack_bar.dart';

extension ShowErrorSnackBar on ScaffoldMessengerState {
  void showErrorSnackBar({
    required dynamic exception,
  }) {
    ErrorInfo errorInfo = ErrorManager.getErrorMessage(exception);

    showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        duration: const Duration(days: 1), // :(
        backgroundColor: Colors.white,
        content: AppErrorSnackBar(errorInfo: errorInfo),
      ),
    );
  }
}
