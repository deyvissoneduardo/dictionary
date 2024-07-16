import 'package:flutter/material.dart';

extension PlatformExtensions on BuildContext {
  bool mobile() => MediaQuery.of(this).size.shortestSide > 600;
  bool tablet() => MediaQuery.of(this).size.shortestSide > 1200;
  bool web() => MediaQuery.of(this).size.shortestSide < 1201;
}
