import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/widgets/app_app_bar.dart';
import 'package:shoppe/features/settings/ui/widgets/bloc_builder_phone.dart';
import 'package:shoppe/features/settings/ui/widgets/settings_divider.dart';
import 'package:shoppe/features/settings/ui/widgets/bloc_builder_name_and_email.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: 'settings',
        onTap: () {
          context.pop();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Gap(25.h),
            const BlocBuilderNameAndEmail(),
            const SettingsDivider(),
            const BlocBuilderPhone(),
            const SettingsDivider(),
          ],
        ),
      ),
    );
  }
}
