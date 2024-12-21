import 'package:ecommerce_refuerzo_bloc/model/product_model.dart';
import 'package:ecommerce_refuerzo_bloc/pages/bloc/ecommerce_bloc.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EcommerceBloc, EcommerceState>(
      builder: (context, state) {
        return Container(
          color: AppColors.lightgrey,
          child: Column(
            children: [
              _buildCardItem(),
            ],
          ),
        );
        // return ListView.builder(
        //     itemCount: state.cart.length,
        //     itemBuilder: (context, index) {
        //       if (state.cart.isEmpty) {
        //         return Center(
        //           child: Text("No items in cart",
        //               style: TextStyle(color: AppColors.black)),
        //         );
        //       }
        //       final product = state.cart[index];
        //       return _buildCardItem(product);
        //     }
        //     );
      },
    );
  }

  _buildCardItem() {
    return Container(
      height: 130,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      color: AppColors.lime,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_sweep_rounded),
            color: AppColors.red,
          ),
          Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.lightgrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                  "https://assets.nintendo.com/image/upload/f_auto/q_auto/dpr_1.5/c_scale,w_500/ncom/en_US/switch/site-design-update/photo01")),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product title",
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
                        "Product",
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
                              onPressed: () {},
                              icon: const Icon(Icons.remove),
                              color: AppColors.black,
                              iconSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                            child: Center(
                              child: Text("1"),
                            ),
                          ),
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: AppColors.lightgrey,
                            child: IconButton(
                              onPressed: () {},
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
