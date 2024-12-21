part of 'ecommerce_bloc.dart';

sealed class EcommerceEvent extends Equatable {
  const EcommerceEvent();

  @override
  List<Object> get props => [];
}

//evento para cargar los productos al carrito
class LoadProductsEvent extends EcommerceEvent {}

//evento para agregar los productos al carrito
class AddToCartEvent extends EcommerceEvent {
  final ProductModel product;

  const AddToCartEvent({required this.product});
}

//evento para actualizar cantidad de productos al carrito
class UpdateQuantityEvent extends EcommerceEvent {}

//evento para remover los productos al carrito
class RemoveFromCartEvent extends EcommerceEvent {}
