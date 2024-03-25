import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppe/core/widgets/app_slide_scale_fade_transition.dart';

class AppNoData extends StatelessWidget {
  const AppNoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppSlideScaleFadeTransition(
        scaleOffsetEnd: 3,
        child: SvgPicture.asset(
          'assets/svgs/no_data.svg',
          width: 200.w,
        ),
      ),
    );
  }
}
