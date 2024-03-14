import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/settings/logic/settings_cubit.dart';
import 'package:shoppe/features/settings/logic/settings_state.dart';

class MessageErrorEditeProfile extends StatelessWidget {
  const MessageErrorEditeProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          current is SuccessPutData || current is LoadingPutData,
      builder: (context, state) {
        if (state is SuccessPutData) {
          if (state.profileResponse.status == true) {
            context.pop();
          }
          return Text(
            state.profileResponse.status == false
                ? state.profileResponse.message.toString()
                : '',
            style: TextStyles.font13RedSemiBold,
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
