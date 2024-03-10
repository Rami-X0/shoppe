import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_text_form_field.dart';
import 'package:shoppe/features/search/logic/search_cubit.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: Form(
        key: context.read<SearchCubit>().formKey,
        child: AppTextFormField(
          hintText: 'search',
          fillColor: ColorsManager.mainBlue.withOpacity(0.1),
          validator: (value) {
            return validatorSearch(value);
          },
          controller: context.read<SearchCubit>().searchController,
        ),
      ),
    );
  }

  String? validatorSearch(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please, enter the product name';
    }

    return null;
  }
}
