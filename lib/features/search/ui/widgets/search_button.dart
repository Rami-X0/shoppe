import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widgets/app_icon_button_and_tool_tip.dart';
import 'package:shoppe/features/search/logic/search_cubit.dart';
import 'package:shoppe/features/search/logic/search_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsManager.mainBlue.withOpacity(0.1),
      ),
      child: Center(
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return AppIconButtonAndToolTip(
              colorIcon: ColorsManager.mainBlue,
              highlightColor: ColorsManager.mainBlue.withOpacity(0.1),
              toolTipMessage: AppLocalizations.of(context)!.search,
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                context.read<SearchCubit>().validateSearch(context);
              },
            );
          },
        ),
      ),
    );
  }


}
