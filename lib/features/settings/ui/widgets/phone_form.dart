import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_text_form_field.dart';
import 'package:shoppe/features/settings/data/models/profile_response.dart';
import 'package:shoppe/features/settings/logic/settings_cubit.dart';
import 'package:shoppe/features/settings/ui/widgets/button_edite_phone.dart';
import 'package:shoppe/features/settings/ui/widgets/message_error_edite_profile.dart';
import 'package:shoppe/features/settings/ui/widgets/setting_close_button.dart';

class PhoneForm extends StatefulWidget {
  final ProfileResponse profileResponse;

  const PhoneForm({super.key, required this.profileResponse});

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  @override
  void initState() {
    super.initState();
    nameAndEmailAndPhoneControllerEqualData();
  }

  void nameAndEmailAndPhoneControllerEqualData() {
    context.read<SettingsCubit>().emailController.text =
        widget.profileResponse.userData!.email.toString();
    context.read<SettingsCubit>().nameController.text =
        widget.profileResponse.userData!.name.toString();
    context.read<SettingsCubit>().phoneController.text =
        widget.profileResponse.userData!.phone.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SettingsCubit>().phoneKey,
      child: Column(
        children: [
          const SettingsCloseButton(),
          Gap(10.h),
          const MessageErrorEditeProfile(),
          Gap(5.h),
          AppTextFormField(
            suffixIcon: FaIcon(
              FontAwesomeIcons.phone,
              size: 20.w,
              color: ColorsManager.mainBlue,
            ),
            labelText: Text(
              'phone',
              style: TextStyles.font15MainBlueSemiBold,
            ),
            validator: (value) {
              return phoneValidate(value);
            },
            controller: context.read<SettingsCubit>().phoneController,
          ),
          Gap(15.h),
          const ButtonEditePhone(),
        ],
      ),
    );
  }

  String? phoneValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone ';
    }
    return null;
  }
}
