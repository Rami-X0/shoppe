import 'package:flutter/material.dart';
import 'package:shoppe/core/theming/styles.dart';

class SettingsTextLoading extends StatelessWidget {
  const SettingsTextLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Loading...',
      style: TextStyles.font15MainBlueSemiBold,
    );
  }
}
