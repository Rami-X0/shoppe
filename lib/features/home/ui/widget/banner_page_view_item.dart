import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerPageViewItem extends StatelessWidget {
  const BannerPageViewItem({
    super.key,
    required this.currentIndex,
    required this.index,
  });

  final double circular = 10;
  final int currentIndex;

  final int index;

  @override
  Widget build(BuildContext context) {
    bool isShowing = index == currentIndex;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: AnimatedContainer(
        width: 250,
        height: 250,
        duration: const Duration(milliseconds: 700),
        margin: EdgeInsets.only(
          top: isShowing ? 10 : 20,
          bottom: isShowing ? 10 : 20,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white30,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(circular),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 4),
                blurRadius: 2)
          ],
        ),
        //
        child: ClipRRect(
          borderRadius: BorderRadius.circular(circular),
          child: CachedNetworkImage(
            imageUrl: image[index % image.length],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<String> image = [
  'https://img.freepik.com/free-photo/camera-capture-snap-shot-graphic_53876-121027.jpg?w=740&t=st=1707588234~exp=1707588834~hmac=2445ee4d6faa919075ca4b62b098de27a20d1af19eb86b05a050be3b8eecdc76',
  'https://img.freepik.com/free-photo/camera-photographic-with-smartphone-devices-generative-ai_188544-12171.jpg?w=740&t=st=1707588287~exp=1707588887~hmac=7f60a63139f24e820599e1ba418123ff25d031c28137e771867784f88ccfa78d',
  'https://img.freepik.com/free-photo/vertical-image-landscape-orange-sand-dunes-against-blue-sky_181624-36965.jpg?w=740&t=st=1707588511~exp=1707589111~hmac=13dc2879a8234ee33bca266ad5889946c0e9eee35049a26c13849df7eb449838'
];
