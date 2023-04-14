import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle pageTitle = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle pageSubtitle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static TextStyle details = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static TextStyle inputLabel = const TextStyle(
    color: Colors.black,
  );

  static TextStyle buttonBig = const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  static TextStyle textSpan = const TextStyle(
    color: Colors.grey,
    fontSize: 14,
  );

  static TextStyle textSpanButton = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    decoration: TextDecoration.underline,
  );
}
