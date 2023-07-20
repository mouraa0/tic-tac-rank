import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/widgets/buttons/app_button_widget.dart';
import 'package:tic_tac_rank_app/core/widgets/conditional_parent/conditiona_parent.dart';
import 'package:tic_tac_rank_app/core/widgets/title/title_widget.dart';

class AppScaffold extends StatelessWidget {
  final List<String> pageTitle;
  final bool isFixedHeight;
  final bool showFloatingButton;
  final List<Widget> body;

  const AppScaffold({
    super.key,
    required this.pageTitle,
    required this.body,
    this.isFixedHeight = false,
    this.showFloatingButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: showFloatingButton
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AppButton(
                title: 'Play',
                onPressed: () {},
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: ConditionalParentWidget(
          condition: isFixedHeight,
          parentBuilder: (child) => SizedBox(
            height: MediaQuery.of(context).size.height,
            child: child,
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 70),
                AppTitleWidget(subtitle: pageTitle),
                const SizedBox(height: 34),
                ...body,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
