import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_icon_button_and_tool_tip.dart';
import 'package:shoppe/features/search/logic/search_cubit.dart';
import 'package:shoppe/features/search/ui/search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 50.h,
        surfaceTintColor: Colors.white,
        title: Row(
          children: [
            _iconDrawerAndTextShoppe(context),
            const Spacer(),
            AppIconButtonAndToolTip(
              onTap: () {
                showModalBottomSheet(
                  isDismissible: true,
                  context: context,
                  isScrollControlled: true,
                  builder: (index) {
                    return const SearchScreen();
                  },
                ).whenComplete(() {
                  context.read<SearchCubit>().searchController.clear();
                });
              },
              icon: FontAwesomeIcons.magnifyingGlass,
              toolTipMessage: AppLocalizations.of(context)!.search,
            ),
          ],
        ),
      ),
    );
  }

  Row _iconDrawerAndTextShoppe(BuildContext context) {
    return Row(
      children: [
        AppIconButtonAndToolTip(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          icon: FontAwesomeIcons.bars,
          toolTipMessage: 'drawer',
        ),
        Gap(5.w),
        Text(
          AppLocalizations.of(context)!.shoppe,
          style: TextStyles.font18MainBlueSemiBold.copyWith(
            fontSize: 25.sp,
          ),
        ),
        Gap(15.w),
        SvgPicture.asset('assets/svgs/shoppe_logo.svg', width: 35.w, height: 35.h),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.h);
}
