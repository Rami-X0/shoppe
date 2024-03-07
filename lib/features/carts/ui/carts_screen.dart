import 'package:flutter/material.dart';
import 'package:shoppe/features/carts/ui/widgets/bloc_builder_carts_view.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:const BlocBuilderCartsView(),
    );
  }
}
