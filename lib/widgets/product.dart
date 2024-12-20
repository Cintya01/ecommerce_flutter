import 'package:ecommerce_refuerzo_bloc/data.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/app_colors.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/app_primary_button.dart';
import 'package:flutter/material.dart';

class Productidget extends StatelessWidget {
  const Productidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final product = productJsonData[index];
          return _buildCardProduct(
            title: product["title"],
            amount: product["amount"].toString(),
            productId: product["id"].toString(),
            image: NetworkImage(product["image_url"]),
          );
        },
      ),
    );
  }

  _buildCardProduct({
    required String title,
    required String amount,
    required String productId,
    required NetworkImage image,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
            ),
            color: AppColors.lightgrey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppPrimaryButton(
          onTap: () {
            //bloc el evento tap de agregar al carrito
          },
          text: "Add to cart",
          fontSizeButton: 12,
          heightButton: 30,
        ),
      ],
    );
  }
}
