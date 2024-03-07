import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoppe/features/home/data/models/banners_response.dart';
import 'package:shoppe/features/home/ui/widget/banners/banners_view_item.dart';

class BannersView extends StatelessWidget {
  final BannersResponse bannersResponse;

  const BannersView({super.key, required this.bannersResponse});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        initialPage: 2,
        autoPlay: true,
        autoPlayCurve: Curves.linear,
        enlargeCenterPage: true,
        animateToClosest: true,
        viewportFraction: 0.80,
        autoPlayAnimationDuration: const Duration(milliseconds: 750),
      ),
      itemCount: bannersResponse.bannersData!.length,
      itemBuilder: (context, index, realIndex) {
        return BannersViewItem(
          bannersResponse: bannersResponse,
          index: index,
        );
      },
    );
  }
}
