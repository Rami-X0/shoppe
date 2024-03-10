import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/widgets/app_icon_button_and_tool_tip.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onTap;

  const AppAppBar({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 45.h,
      shadowColor: ColorsManager.mainBlue.withOpacity(0.3),
      elevation: 5,
      surfaceTintColor: ColorsManager.skyBlue,
      foregroundColor: ColorsManager.skyBlue,
      centerTitle: true,
      title: Text(
        title.toString(),
        style: TextStyles.font18MainBlueSemiBold,
      ),
      automaticallyImplyLeading: false,
      leading: AppIconButtonAndToolTip(
        toolTipMessage: 'back',
        onTap: onTap,
        icon: FontAwesomeIcons.arrowLeft,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.h);
}
