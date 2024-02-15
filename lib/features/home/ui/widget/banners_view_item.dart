import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/features/home/data/models/banners_response.dart';

class BannersViewItem extends StatelessWidget {
  final BannersResponse bannersResponse;
  final int index;

  const BannersViewItem({
    super.key,
    required this.bannersResponse,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.darkBlue.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(-10, 25),
            spreadRadius: 5,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: CachedNetworkImage(
          imageUrl: bannersResponse.bannersData![index].image.toString(),
          placeholder: (context, url) => const Center(
            child: FaIcon(
              FontAwesomeIcons.solidHourglassHalf,
              color: Colors.black12,
              size: 50,
            ),
          ),
          errorWidget: (context, error, url) => errorDownloadImage(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget errorDownloadImage() {
    return SizedBox(
      width: 255.w,
      height: 225.h,
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
