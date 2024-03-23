import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/widgets/app_text_form_field.dart';
import 'package:shoppe/features/search/logic/search_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          autoFocus: true,
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
          hintText: AppLocalizations.of(context)!.search,
        onEditingComplete: (){
          actionButtonSearchKeyBoard(context);
        },
          validator: (value) {
            return validateSearch(value);
          },
          controller: context.read<SearchCubit>().searchController,
        ),
      ),
    );
  }

  String? validateSearch(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.enter_product_name;
    }

    return null;
  }
  void actionButtonSearchKeyBoard(BuildContext context) {
    if (context.read<SearchCubit>().formKey.currentState!.validate()) {
      context.read<SearchCubit>().emitSearch();
    }
  }
}
