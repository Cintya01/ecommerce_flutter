import 'dart:developer';

import 'package:ecommerce_refuerzo_bloc/model/product_model.dart';
import 'package:ecommerce_refuerzo_bloc/pages/bloc/ecommerce_bloc.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heightDirectionContainer = size.height * 0.1;

    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: AppColors.lightgrey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image(
                  image: const Svg("assets/icons/menu-puntos.svg"),
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          //direccion
          Positioned(
            child: Container(
              height: heightDirectionContainer,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 8,
                  bottom: 16,
                  right: 16,
                  left: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightgrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.grey,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "92 High Street, London",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //card productos
          Positioned(
            child: Container(
              margin: EdgeInsets.only(top: heightDirectionContainer * 0.7 + 30),
              child: _cartSection(),
            ),
          ),
          //boton checkout
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(Size(size.width, 40)),
                backgroundColor: WidgetStateProperty.all(AppColors.lime),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                "Checkout",
                style: TextStyle(color: AppColors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  _cartSection() {
    return BlocBuilder<EcommerceBloc, EcommerceState>(
      builder: (context, state) {
        return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: ListView.builder(
              itemCount: state.cart.length,
              itemBuilder: (context, index) {
                if (state.cart.isEmpty) {
                  return const SizedBox.shrink();
                }
                final product = state.cart[index];
                return _buildCardItem(
                  context: context,
                  product: product,
                );
              },
            ));
      },
    );
  }

  _buildCardItem(
      {required ProductModel product, required BuildContext context}) {
    return Container(
      height: 130,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context
                  .read<EcommerceBloc>()
                  .add((RemoveFromCartEvent(product: product)));
            },
            icon: const Icon(Icons.delete),
            color: AppColors.red,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.lightgrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(product.imageUrl),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.amount * product.quantity}",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: AppColors.lightgrey,
                            child: IconButton(
                              onPressed: () {
                                context.read<EcommerceBloc>().add(
                                    DecreaseQuantityEvent(product: product));
                              },
                              icon: const Icon(Icons.remove),
                              color: AppColors.black,
                              iconSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(product.quantity.toString()),
                            ),
                          ),
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: AppColors.lightgrey,
                            child: IconButton(
                              onPressed: () {
                                context.read<EcommerceBloc>().add(
                                    IncreaseQuantityEvent(product: product));
                              },
                              icon: const Icon(Icons.add),
                              color: AppColors.black,
                              iconSize: 14,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}




          // Container(
          //   margin: EdgeInsets.only(top: heightDirectionContainer * 0.7 + 30),
          //   child: _cartSection(),
          // ),
          // Positioned(
          //   bottom: 0,
          //   left: 16,
          //   right: 16,
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     style: ButtonStyle(
          //       minimumSize: WidgetStateProperty.all(Size(size.width, 40)),
          //       backgroundColor: WidgetStateProperty.all(AppColors.lime),
          //       shape: WidgetStateProperty.all(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8),
          //         ),
          //       ),
          //     ),
          //     child: Text(
          //       "Checkout",
          //       style: TextStyle(color: AppColors.black),
          //     ),
          //   ),
          // )