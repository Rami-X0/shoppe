import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_icon_button_and_tool_tip.dart';
import 'package:shoppe/features/carts/data/models/carts_request.dart';
import 'package:shoppe/features/carts/logic/carts_cubit.dart';

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
            AppIconButtonAnfToolTip(
              onTap: () {


              },
              icon: FontAwesomeIcons.cartShopping,
              toolTipMessage: 'carts',
            ),
          ],
        ),
      ),
    );
  }

  Row _iconDrawerAndTextShoppe(BuildContext context) {
    return Row(
      children: [
        AppIconButtonAnfToolTip(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          icon: FontAwesomeIcons.bars,
          toolTipMessage: 'drawer',
        ),
        Gap(5.w),
        Text(
          'Shoppe',
          style: TextStyles.font18MainBlueSemiBold.copyWith(
            fontSize: 25.sp,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.h);
}
