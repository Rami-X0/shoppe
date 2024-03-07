import 'package:flutter/material.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/features/favorites/ui/widgets/bloc_builder_favorites_view.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 35,
        automaticallyImplyLeading: false,
        leading: BackButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          color: ColorsManager.mainBlue,
        ),
      ),
      body: const BlocBuilderFavoritesView(),
    );
  }
}
