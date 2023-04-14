import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';

class AppFormsDividerWidget extends StatelessWidget {
  const AppFormsDividerWidget({
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
