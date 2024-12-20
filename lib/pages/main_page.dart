import 'package:ecommerce_refuerzo_bloc/pages/cart_page.dart';
import 'package:ecommerce_refuerzo_bloc/pages/home_page.dart';
import 'package:ecommerce_refuerzo_bloc/widgets/app_colors.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: AppColors.black,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: AppColors.lime,
              ),
              icon: Icon(
                Icons.home,
                color: AppColors.black,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.search,
                color: AppColors.lime,
              ),
              icon: Icon(
                Icons.search,
                color: AppColors.black,
              ),
              label: "Catalog",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.lime,
              ),
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.black,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite_border_rounded,
                color: AppColors.lime,
              ),
              icon: Icon(
                Icons.favorite_border_rounded,
                color: AppColors.black,
              ),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                color: AppColors.lime,
              ),
              icon: Icon(
                Icons.person,
                color: AppColors.black,
              ),
              label: "Profile",
            ),
          ]),
    );
  }
}
