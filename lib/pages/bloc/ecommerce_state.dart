part of 'ecommerce_bloc.dart';

enum HomeScreenState {
  none,
  loading,
  success,
  failure,
}

class EcommerceState extends Equatable {
  final List<ProductModel> products;
  final List<ProductModel> cart;
  final List<ProductModel> filteredproducts;
  final HomeScreenState homeScreenState;

  const EcommerceState(
      {required this.products,
      required this.cart,
      required this.filteredproducts,
      required this.homeScreenState});

  factory EcommerceState.initial() {
    return const EcommerceState(
      products: [],
      cart: [],
      filteredproducts: [],
      homeScreenState: HomeScreenState.none,
    );
  }

  EcommerceState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? cart,
    List<ProductModel>? filteredproducts,
    HomeScreenState? homeScreenState,
  }) {
    return EcommerceState(
      cart: cart ?? this.cart,
      products: products ?? this.products,
      filteredproducts: filteredproducts ?? this.filteredproducts,
      homeScreenState: homeScreenState ?? this.homeScreenState,
    );
  }

  @override
  List<Object> get props => [products, cart, homeScreenState, filteredproducts];
}
