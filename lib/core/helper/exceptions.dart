import 'package:flutter/material.dart';

extension NavigatorHelper on BuildContext {
  void navigatorPushNamed(String name) {
    Navigator.pushNamed(this, name);
  }

  void navigatorPushNamedAndRemoveUntil(String name) {
    Navigator.pushNamedAndRemoveUntil(this, name, (route) => false);
  }

  void navigatorPop(String name) {
    Navigator.pop(this);
  }
}
