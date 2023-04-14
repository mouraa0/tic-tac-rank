import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtherOptionsComponent extends StatelessWidget {
  const OtherOptionsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _BoxComponent(icon: 'google_logo_icon.svg'),
        SizedBox(width: 20),
        _BoxComponent(icon: 'apple_logo_icon.svg'),
      ],
    );
  }
}

class _BoxComponent extends StatelessWidget {
  final String icon;

  const _BoxComponent({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: SvgPicture.asset('assets/icons/$icon'),
    );
  }
}
