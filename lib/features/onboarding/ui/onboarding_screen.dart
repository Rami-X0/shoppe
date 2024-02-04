import 'package:flutter/material.dart';
import 'package:shoppe/features/onboarding/ui/widgets/get_started_button.dart';
import 'package:shoppe/features/onboarding/ui/widgets/shoppe_logo_and_text.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ShoppeLogoAndText(),
          GetStartedButton(),
        ],
      ),
    );
  }
}
