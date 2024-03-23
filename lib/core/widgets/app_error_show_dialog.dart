import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/helper/spacing.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_text_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AppErrorShowDialog extends StatelessWidget {
  const AppErrorShowDialog({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX:5, sigmaY: 5),
      child: Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: SizedBox(
          height: 355.h,
          width: 250.w,
          child: Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  width: 300.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      verticalSpace(70),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w,),
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          style: TextStyles.font13DarkBlueMedium,
                        ),
                      ),
                      const Spacer(),
                      AppTextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: AppLocalizations.of(context)!.okay,
                        textStyle: TextStyles.font22WhiteBold,
                        backGroundColor: Colors.red,
                        horizontalSize: 200,
                        verticalSize: 55,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(side: BorderSide.none),
                  elevation: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 40,
                    child: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.pink.withOpacity(0.2),
                      child: const FaIcon(
                        FontAwesomeIcons.circleExclamation,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
