import 'package:ecommerce_refuerzo_bloc/pages/bloc/ecommerce_bloc.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                Text("See all",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                    )),
                const SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: AppColors.lightgrey,
                  radius: 10,
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: AppColors.black,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              categoryCard(
                title: "Phones",
                image: "boton-movil",
                isActive: true,
                press: () {},
              ),
              categoryCard(
                title: "Headphones",
                image: "auriculares",
                press: () {},
              ),
              categoryCard(
                title: "Accessories",
                image: "altavoz-de-la-computadora",
                press: () {},
              ),
              categoryCard(
                title: "Console",
                image: "controlador-de-consola",
                press: () {},
              ),
              categoryCard(
                title: "Games",
                image: "dados-d6",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

categoryCard({
  required String title,
  bool isActive = false,
  required String image,
  required Function press,
}) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: isActive ? AppColors.lime : AppColors.lightgrey,
        radius: 25,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image(
            image: Svg("assets/icons/$image.svg"),
            color: isActive ? AppColors.white : AppColors.black,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(title,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isActive ? AppColors.black : AppColors.grey)),
    ],
  );
}
