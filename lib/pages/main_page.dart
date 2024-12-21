import 'package:ecommerce_refuerzo_bloc/pages/bloc/ecommerce_bloc.dart';
import 'package:ecommerce_refuerzo_bloc/pages/cart_page.dart';
import 'package:ecommerce_refuerzo_bloc/pages/home_page.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    Center(
      child: Text("Catalog 404"),
    ),
    CartPage(),
    Center(
      child: Text("Favorites 404"),
    ),
    Center(
      child: Text("Profile 404"),
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[selectedIndex],
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 80,
            color: AppColors.white,
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _itemBottomMenu(
                  onTap: () {
                    onItemTapped(0);
                  },
                  isActive: selectedIndex == 0,
                  icon: Icons.home,
                  title: "Home",
                ),
                _itemBottomMenu(
                  onTap: () {
                    onItemTapped(1);
                  },
                  isActive: selectedIndex == 1,
                  icon: Icons.search,
                  title: "Catalog",
                ),
                _itemBottomMenu(
                  onTap: () {
                    onItemTapped(2);
                  },
                  isActive: selectedIndex == 2,
                  isCartItem: true,
                  icon: Icons.shopping_bag_outlined,
                  title: "Cart",
                ),
                _itemBottomMenu(
                  onTap: () {
                    onItemTapped(3);
                  },
                  isActive: selectedIndex == 3,
                  icon: Icons.favorite_border_rounded,
                  title: "Favorites",
                ),
                _itemBottomMenu(
                  onTap: () {
                    onItemTapped(4);
                  },
                  isActive: selectedIndex == 4,
                  icon: Icons.person,
                  title: "Profile",
                ),
              ],
            )));
  }

  Widget _itemBottomMenu({
    required Function() onTap,
    required bool isActive,
    required IconData icon,
    required String title,
    bool isCartItem = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(children: [
        Column(children: [
          Icon(
            icon,
            color: isActive ? AppColors.lime : AppColors.black,
          ),
          Text(title,
              style: TextStyle(
                color: isActive ? AppColors.black : AppColors.grey,
              ))
        ]),
        if (isCartItem)
          BlocBuilder<EcommerceBloc, EcommerceState>(
            builder: (context, state) {
              if (state.cart.isEmpty) {
                return const SizedBox.shrink();
              }
              final total = state.cart
                  .fold(0, (prev, element) => prev + element.quantity);

              return Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      total.toString(),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
      ]),
    );
  }
}
