import 'package:flutter/material.dart';
import 'package:shoppe/features/home/ui/widget/home_banners.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BannersPageView()
        ],
      ),
    );
  }
}
