import 'package:ecommerce_refuerzo_bloc/model/product_model.dart';
import 'package:ecommerce_refuerzo_bloc/pages/bloc/ecommerce_bloc.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/app_colors.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Productidget extends StatelessWidget {
  const Productidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: BlocBuilder<EcommerceBloc, EcommerceState>(
        builder: (context, state) {
          if (state.homeScreenState == HomeScreenState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final product = state.products[index];
              return _buildCardProduct(
                context: context,
                product: product,
              );
            },
          );
        },
      ),
    );
  }

  _buildCardProduct({
    required BuildContext context,
    required ProductModel product,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 160,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.lightgrey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.network(product.imageUrl),
        ),
        Text(
          product.title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "\$${product.amount}",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppPrimaryButton(
          onTap: () {
            context.read<EcommerceBloc>().add(AddToCartEvent(
                  product: product,
                ));
          },
          text: "Add to cart",
          fontSizeButton: 12,
          heightButton: 30,
        ),
      ],
    );
  }
}
