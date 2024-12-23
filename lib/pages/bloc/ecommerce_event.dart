part of 'ecommerce_bloc.dart';

sealed class EcommerceEvent extends Equatable {
  const EcommerceEvent();

  @override
  List<Object> get props => [];
}

class LoadProductsEvent extends EcommerceEvent {}

class AddToCartEvent extends EcommerceEvent {
  final ProductModel product;

  const AddToCartEvent({required this.product});
}

//class UpdateCartQuantityEvent extends EcommerceEvent {}
class IncreaseQuantityEvent extends EcommerceEvent {
  final ProductModel product;

  const IncreaseQuantityEvent({required this.product});
}

class DecreaseQuantityEvent extends EcommerceEvent {
  final ProductModel product;

  const DecreaseQuantityEvent({required this.product});
}

class RemoveFromCartEvent extends EcommerceEvent {
  final ProductModel product;

  const RemoveFromCartEvent({required this.product});
}
