import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/widgets/app_app_bar.dart';
import 'package:shoppe/features/favorites/ui/widgets/bloc_builder_favorites_view.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        onTap: () {
          context.pop();
        },
        title: 'favorites',
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 15.h),
        child: const BlocBuilderFavoritesView(),
      ),
    );
  }
}
