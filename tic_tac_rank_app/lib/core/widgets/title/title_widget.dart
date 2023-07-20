import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';
import 'package:tic_tac_rank_app/core/widgets/logo/logo.dart';

class AppTitleWidget extends StatelessWidget {
  final List<String> subtitle;

  const AppTitleWidget({
    super.key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _UpperPart(subtitle: subtitle),
        const SizedBox(height: 10),
        _Subtitle(subtitle: subtitle),
      ],
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    required this.subtitle,
  });

  final List<String> subtitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: subtitle[0],
            style: AppTextStyles.pageSubtitle,
          ),
          TextSpan(
            text: subtitle[1],
            style: AppTextStyles.pageSubtitleHighlighted,
          ),
        ],
      ),
    );
  }
}

class _UpperPart extends StatelessWidget {
  final List<String> subtitle;

  const _UpperPart({
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppLogo(),
        InkWell(
          onTap: Scaffold.of(context).openDrawer,
          child: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
