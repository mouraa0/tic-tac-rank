import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';

class AppFormsTitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const AppFormsTitleWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyles.pageTitle),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.pageSubtitle,
          ),
        ),
      ],
    );
  }
}
