import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      width: 240.w,
      backgroundColor: ColorsManager.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  Text('Rami Elnaggar'),
                ],
              ),
            ),
          ),
          _buildIconAndTextDrawer(
              context: context,
              onTap: () {
                context.pushNamed(Routes.favoritesScreen);
              },
              icon: FontAwesomeIcons.heartCircleCheck,
              text: 'F A V O R I T E'),
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
            color: ColorsManager.grey,
          ),
          Gap(35.w),
          Text(
            text,
            style: TextStyles.font15greySemiBold,
          )
        ],
      ),
    );
  }
}
