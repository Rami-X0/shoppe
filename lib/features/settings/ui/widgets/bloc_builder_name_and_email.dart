import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/settings/logic/settings_cubit.dart';
import 'package:shoppe/features/settings/logic/settings_state.dart';
import 'package:shoppe/features/settings/ui/widgets/settings_name_and_email.dart';
import 'package:shoppe/features/settings/ui/widgets/settings_text_loading.dart';

class BlocBuilderNameAndEmail extends StatelessWidget {
  const BlocBuilderNameAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SettingsCubit>(context).emitProfile();
    return SizedBox(
      height: 185.h,
      child: BlocBuilder<SettingsCubit, SettingsState>(
        buildWhen: (previous, current) =>
            current is LoadingGetProfile || current is SuccessGetProfile,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const SizedBox.shrink();
            },
            loadingGetProfile: () {
              return SettingsTextLoading(textStyle:TextStyles.font18MainBlueSemiBold);
            },
            loadingPutData: () {
              return SettingsTextLoading(textStyle:TextStyles.font18MainBlueSemiBold,);
            },
            successGetProfile: (profileResponse) {
              return SettingsNameAndEmail(profileResponse: profileResponse);
            },
          );
        },
      ),
    );
  }
}
