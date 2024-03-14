import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280.w,
      backgroundColor: ColorsManager.skyBlue,
      child: Column(
        children: [
          Gap(70.h),
          SvgPicture.asset(
            'assets/svgs/shoppe_logo.svg',
            width: 70,
            height: 70,
          ),
          Gap(70.h),
          _buildIconAndTextDrawer(
              context: context,
              onTap: () {
                context.pushNamed(Routes.favoritesScreen);
              },
              icon: FontAwesomeIcons.solidHeart,
              text: 'F A V O R I T E S'),
          Gap(35.h),
          _buildIconAndTextDrawer(
              context: context,
              onTap: () {
                context.pushNamed(Routes.cartsScreen);
              },
              icon: FontAwesomeIcons.cartShopping,
              text: 'C A R T S'),

          Gap(35.h),
          _buildIconAndTextDrawer(
              context: context,
              onTap: () {
                context.pushNamed(Routes.settingsScreen);
              },
              icon: FontAwesomeIcons.gear,
              text: 'S E T T I N G S'),

        ],
      ),
    );
  }

  GestureDetector _buildIconAndTextDrawer({
    required BuildContext context,
    required VoidCallback onTap,
    required String text,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Gap(25.w),
          FaIcon(
            icon,
            color: ColorsManager.mainBlue,
          ),
          Gap(35.w),
          Text(
            text,
            style: TextStyles.font15MainBlueSemiBold,
          )
        ],
      ),
    );
  }
}
