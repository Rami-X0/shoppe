import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';

class AppIconButtonAndToolTip extends StatelessWidget {
  final String toolTipMessage;
  final IconData icon;
  final VoidCallback onTap;
  final Color? highlightColor;
  final Color? colorIcon;

  const AppIconButtonAndToolTip({
    super.key,
    required this.toolTipMessage,
    required this.icon,
    required this.onTap,
    this.highlightColor, this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTipMessage,
      child: IconButton(
        highlightColor: highlightColor ?? ColorsManager.skyBlue,
        onPressed: onTap,
        icon: FaIcon(
          icon,
          size: 20.w,
          color:colorIcon?? ColorsManager.mainBlue,
        ),
      ),
    );
  }
}
