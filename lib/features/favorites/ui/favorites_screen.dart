import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/widgets/app_app_bar.dart';
import 'package:shoppe/features/favorites/ui/widgets/bloc_builder_favorites_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        onTap: () {
          context.pop();
        },
        title: AppLocalizations.of(context)!.favorites,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 15.h),
        child: const BlocBuilderFavoritesView(),
      ),
    );
  }
}
