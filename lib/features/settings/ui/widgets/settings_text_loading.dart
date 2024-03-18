import 'package:flutter/material.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsTextLoading extends StatelessWidget {
  final double? height;
  const SettingsTextLoading({super.key,  this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??0,
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.loading,
          style: TextStyles.font15MainBlueSemiBold,
        ),
      ),
    );
  }
}
