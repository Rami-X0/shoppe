import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';

class AppIconButtonAndToolTip extends StatelessWidget {
  final String toolTipMessage;
  final IconData icon;
  final VoidCallback onTap;

  const AppIconButtonAndToolTip({
    super.key,
    required this.toolTipMessage,
    required this.icon, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTipMessage,
      child: IconButton(
        highlightColor: ColorsManager.skyBlue,
        onPressed: onTap,
        icon: FaIcon(
          icon,
          size: 20.w,
          color: ColorsManager.mainBlue,
        ),
      ),
    );
  }
}
