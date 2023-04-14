import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';

class AppFormsTitleWidget extends StatelessWidget {
  final String title;
  final List<String> subtitle;

  const AppFormsTitleWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('TicTacRank', style: AppTextStyles.pageTitle),
        const SizedBox(height: 10),
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
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 30),
        //   child: Text(
        //     subtitle,
        //     textAlign: TextAlign.center,
        //     style: AppTextStyles.pageSubtitle,
        //   ),
        // ),
      ],
    );
  }
}
