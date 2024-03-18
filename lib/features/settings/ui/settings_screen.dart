import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/widgets/app_app_bar.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/settings/ui/widgets/bloc_builder_phone.dart';
import 'package:shoppe/features/settings/ui/widgets/language_button.dart';
import 'package:shoppe/features/settings/ui/widgets/log_oute_button.dart';
import 'package:shoppe/features/settings/ui/widgets/settings_divider.dart';
import 'package:shoppe/features/settings/ui/widgets/bloc_builder_name_and_email.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: AppLocalizations.of(context)!.settings,
        onTap: () {
          context.pop();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Gap(25.h),
              const BlocBuilderNameAndEmail(),
              const SettingsDivider(),
              const BlocBuilderPhone(),
              const SettingsDivider(),
              const LanguageButton(),
              const SettingsDivider(),
              const LogOutButton(),
              const SettingsDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
