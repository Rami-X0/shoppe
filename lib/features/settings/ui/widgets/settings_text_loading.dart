import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/features/settings/ui/widgets/loading_animation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTextLoading extends StatelessWidget {
  final TextStyle textStyle;
  final Color? backgroundColor;

  const SettingsTextLoading({
    super.key,
    required this.textStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return listTextLoading(context);
  }

  Container listTextLoading(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
      ),
      height: 120.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loadingText(text: AppLocalizations.of(context)!.loading),
          LoadingAnimation(delay: 0, child: loadingText(text: '.')),
          LoadingAnimation(delay: 500, child: loadingText(text: '.')),
          LoadingAnimation(delay: 1000, child: loadingText(text: '.')),
        ],
      ),
    );
  }

  Text loadingText({required String text}) {
    return Text(text, style: textStyle);
  }
}
