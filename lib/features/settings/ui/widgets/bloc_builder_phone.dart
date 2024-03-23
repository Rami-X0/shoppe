import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/settings/logic/settings_cubit.dart';
import 'package:shoppe/features/settings/logic/settings_state.dart';
import 'package:shoppe/features/settings/ui/widgets/phone_edite.dart';
import 'package:shoppe/features/settings/ui/widgets/settings_text_loading.dart';

class BlocBuilderPhone extends StatelessWidget {
  const BlocBuilderPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          current is LoadingGetProfile || current is SuccessGetProfile,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const SizedBox.shrink();
          },
          loadingGetProfile: () {
            return SizedBox(
              height: 50.h,
              child: SettingsTextLoading(
                textStyle: TextStyles.font18MainBlueSemiBold,
              ),
            );
          },
          successGetProfile: (profileResponse) {
            return PhoneEdite(profileResponse: profileResponse);
          },
        );
      },
    );
  }
}
