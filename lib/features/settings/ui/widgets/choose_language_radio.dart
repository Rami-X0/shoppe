import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/caching/app_shared_pref.dart';
import 'package:shoppe/core/caching/app_shared_pref_key.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/settings/logic/settings_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shoppe/features/settings/ui/widgets/dialog_choose_language.dart';

class ChooseLanguageRadio extends StatefulWidget {
  const ChooseLanguageRadio({super.key});

  @override
  State<ChooseLanguageRadio> createState() => _ChooseLanguageRadioState();
}

String? radioGroupValue = 'en';

class _ChooseLanguageRadioState extends State<ChooseLanguageRadio> {
  @override
  void initState() {
    super.initState();
    checkRadioButton(context);
  }

  void checkRadioButton(BuildContext context) {
    final settingsCubit = context.read<SettingsCubit>();
    const String arabicCode = 'ar';
    const String englishCode = 'en';
    appLanguage == settingsCubit.arabicLanguageCode
        ? radioGroupValue = arabicCode
        : null;
    appLanguage == settingsCubit.englishLanguageCode
        ? radioGroupValue = englishCode
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _defaultRadio(
            title: AppLocalizations.of(context)!.english,
            value: context.read<SettingsCubit>().englishLanguageCode,
            groupValue: radioGroupValue,
            onChanged: (value) {
              setState(
                () {
                  radioGroupValue = value!;
                  cachingRadio(value);
                  context.read<SettingsCubit>().emitAppLanguage(value);
                },
              );
              showDialogAfterChooseLanguage(context);
            },
          ),
          _defaultRadio(
            title: AppLocalizations.of(context)!.arabic,
            value: context.read<SettingsCubit>().arabicLanguageCode,
            groupValue: radioGroupValue,
            onChanged: (value) {
              setState(
                () {
                  radioGroupValue = value!;
                  cachingRadio(value);
                  context.read<SettingsCubit>().emitAppLanguage(value);
                },
              );
              showDialogAfterChooseLanguage(context);
            },
          ),
        ],
      ),
    );
  }

  showDialogAfterChooseLanguage(BuildContext context) {
    showDialog(
    barrierDismissible: false,
      context: context,
      builder: (context) {
        return const DialogChooseLanguage();
      },
    );
  }



  void cachingRadio(String value) {
    AppSharedPref.sharedPrefSet(
        key: AppSharedPrefKey.appLanguage, value: value);
  }

  RadioListTile _defaultRadio({
    required String title,
    required dynamic value,
    required dynamic groupValue,
    required void Function(dynamic)? onChanged,
  }) {
    return RadioListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
      dense: true,
      fillColor: MaterialStateProperty.all(ColorsManager.mainBlue),
      overlayColor: MaterialStateProperty.all(Colors.red),
      title: Text(
        title,
        style: TextStyles.font15MainBlueSemiBold,
      ),
      value: value,
      onChanged: onChanged,
      groupValue: groupValue,
    );
  }
}
