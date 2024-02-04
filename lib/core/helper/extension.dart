import 'package:flutter/material.dart';

extension NavigatorHelper on BuildContext {
  void pushNamed(String name) {
    Navigator.pushNamed(this, name);
  }

  void navigatorPushNamedAndRemoveUntil(String name) {
    Navigator.pushNamedAndRemoveUntil(this, name, (route) => false);
  }

  void pop() {
    Navigator.pop(this);
  }
}
