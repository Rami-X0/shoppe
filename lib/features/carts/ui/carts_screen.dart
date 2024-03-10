import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/helper/extension.dart';
import 'package:shoppe/core/widgets/app_app_bar.dart';
import 'package:shoppe/features/carts/ui/widgets/bloc_builder_carts_view.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: 'carts',
        onTap: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: const BlocBuilderCartsView(),
      ),
    );
  }
}
