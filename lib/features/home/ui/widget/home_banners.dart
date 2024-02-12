import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/features/home/ui/widget/banner_page_view_item.dart';

class BannersPageView extends StatefulWidget {
  const BannersPageView({super.key});

  @override
  State<BannersPageView> createState() => _BannersPageViewState();
}

class _BannersPageViewState extends State<BannersPageView>
    with TickerProviderStateMixin {
  late Timer _timer;
  late PageController pageController = PageController(
    viewportFraction: 0.9,
    initialPage: image.length,
  );
  int currentIndex = 0;
  double circular = 10;
  bool isShow = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      setState(() {
        isShow = !isShow;
      });
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeInOutQuart,
      );
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          height: 235.h,
          duration: const Duration(milliseconds: 200),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            itemBuilder: (context, index) {
              return BannerPageViewItem(
                currentIndex: currentIndex,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}

List<String> image = [
  'https://img.freepik.com/free-photo/camera-capture-snap-shot-graphic_53876-121027.jpg?w=740&t=st=1707588234~exp=1707588834~hmac=2445ee4d6faa919075ca4b62b098de27a20d1af19eb86b05a050be3b8eecdc76',
  'https://img.freepik.com/free-photo/camera-photographic-with-smartphone-devices-generative-ai_188544-12171.jpg?w=740&t=st=1707588287~exp=1707588887~hmac=7f60a63139f24e820599e1ba418123ff25d031c28137e771867784f88ccfa78d',
  'https://img.freepik.com/free-photo/vertical-image-landscape-orange-sand-dunes-against-blue-sky_181624-36965.jpg?w=740&t=st=1707588511~exp=1707589111~hmac=13dc2879a8234ee33bca266ad5889946c0e9eee35049a26c13849df7eb449838'
];
