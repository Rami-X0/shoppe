import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/settings/ui/widgets/choose_language_radio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  bool showLanguage = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          showLanguage = !showLanguage;
        });
      },
      overlayColor: MaterialStateProperty.all(
        ColorsManager.skyBlue,
      ),
      child: Column(
        children: [
          Gap(5.h),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.globe,
                color: ColorsManager.mainBlue,
                size: 25.w,
              ),
              Gap(15.w),
              Text(
                AppLocalizations.of(context)!.language,
                style: TextStyles.font15MainBlueSemiBold,
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 450),
            height: showLanguage == false ? 10.h : 122.h,
            child:
            showLanguage==false?
            null:const ChooseLanguageRadio(),
          ),
        ],
      ),
    );
  }
}
