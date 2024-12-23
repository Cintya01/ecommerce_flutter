import 'package:ecommerce_refuerzo_bloc/pages/bloc/ecommerce_bloc.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/app_colors.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/categories.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<EcommerceBloc>()..add(LoadProductsEvent()),
      child: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.lightgrey,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
            ),
            child: CircleAvatar(
                backgroundColor: AppColors.lime,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image(
                    image: const Svg("assets/icons/insignia-porcentaje.svg"),
                    color: AppColors.black,
                  ),
                )),
          ),
          title: SizedBox(
            width: size.width,
            child: Column(
              children: [
                Text(
                  "Delivery address",
                  style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "92 High Street, London",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: AppColors.lightgrey,
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image(
                    image: const Svg("assets/icons/campana.svg",
                        size: Size(10, 10)),
                    color: AppColors.black,
                  )),
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 8),
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: const Column(
            children: [CategoriesWidget(), Expanded(child: ProductWidget())],
          ),
        ));
  }
}
