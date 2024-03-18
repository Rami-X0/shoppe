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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ProfileForm extends StatefulWidget {
  final ProfileResponse profileResponse;

  const ProfileForm({super.key, required this.profileResponse});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
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
      key: context.read<SettingsCubit>().nameAndEmailFormKey,
      child: Column(
        children: [

          AppTextFormField(
            labelText:Text(
              AppLocalizations.of(context)!.name,
              style: TextStyles.font15MainBlueSemiBold,
            ),
            suffixIcon: FaIcon(FontAwesomeIcons.userLarge,
                color: ColorsManager.mainBlue, size: 20.w),

            validator: (value) {
              return validateEmail(value);
            },
            controller: context.read<SettingsCubit>().nameController,
          ),
          Gap(10.h),
          AppTextFormField(
            labelText:Text(
              AppLocalizations.of(context)!.email,
              style: TextStyles.font15MainBlueSemiBold,
            ),
            suffixIcon: FaIcon(
              FontAwesomeIcons.solidEnvelope,
              color: ColorsManager.mainBlue,
              size: 20.w,
            ),

            validator: (value) {
              return validateName(value);
            },
            controller: context.read<SettingsCubit>().emailController,
          ),
        ],
      ),
    );
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.enter_name;
    }
    return null;
  }String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.enter_email;
    }
    return null;
  }
}
