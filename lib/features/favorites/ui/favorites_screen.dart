import 'package:flutter/material.dart';
import 'package:shoppe/features/favorites/ui/widgets/bloc_builder_favorites_view.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilderFavoritesView(),
    );
  }
}
