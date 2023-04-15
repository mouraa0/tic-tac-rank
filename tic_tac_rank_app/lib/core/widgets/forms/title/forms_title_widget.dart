import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';

class AppFormsTitleWidget extends StatelessWidget {
  final List<String> subtitle;
  final bool showLogo;

  const AppFormsTitleWidget({
    Key? key,
    required this.subtitle,
    this.showLogo = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLogo) ...[
          Text('TicTacRank', style: AppTextStyles.pageTitle),
          const SizedBox(height: 10),
        ],
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: subtitle[0],
                style: AppTextStyles.pageSubtitleHighlighted,
              ),
              TextSpan(
                text: subtitle[1],
                style: AppTextStyles.pageSubtitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
