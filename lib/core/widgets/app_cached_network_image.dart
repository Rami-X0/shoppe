import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/widgets/app_loading.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final int index;
  final Object object;
  final double? circular;
  final double? widthErrorIcon;
  final double? heightErrorIcon;
  final double? widthImage;
  final double? heightImage;
  final BoxFit? fitImage;

  const AppCachedNetworkImage({
    super.key,
    required this.index,
    required this.object,
    this.circular,
    this.widthErrorIcon,
    this.heightErrorIcon,
    this.widthImage,
    this.heightImage,
    this.fitImage,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(circular ?? 14),
      child: CachedNetworkImage(
        width: widthImage?.w,
        height: heightImage?.h,
        imageUrl: object.toString(),
        placeholder: (context, url) => const AppLoading(),
        errorWidget: (context, error, url) => errorDownloadImage(),
        fit: fitImage,
      ),
    );
  }

  Widget errorDownloadImage() {
    return SizedBox(
      width: widthErrorIcon ?? 255.w,
      height: heightErrorIcon ?? 225.h,
      child: const Center(
        child: FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Colors.black12,
          size: 50,
        ),
      ),
    );
  }
}
