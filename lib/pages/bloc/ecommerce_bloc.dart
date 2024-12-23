import 'dart:developer';

import 'package:ecommerce_refuerzo_bloc/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_refuerzo_bloc/model/product_model.dart';
import 'package:equatable/equatable.dart';

part 'ecommerce_event.dart';
part 'ecommerce_state.dart';

class EcommerceBloc extends Bloc<EcommerceEvent, EcommerceState> {
  EcommerceBloc() : super(EcommerceState.initial()) {
    on<LoadProductsEvent>(_onLoadProductsEvent);
    on<AddToCartEvent>(_onAddToCartEvent);
    on<UpdateQuantityEvent>(_onUpdateQuantityEvent);
    on<RemoveFromCartEvent>(_onRemoveFromCartEvent);
  }

  void _onLoadProductsEvent(
      LoadProductsEvent event, Emitter<EcommerceState> emit) async {
    emit(state.copyWith(homeScreenState: HomeScreenState.loading));

    await Future.delayed(const Duration(milliseconds: 200));

    final products = productJsonData.map((json) {
      return ProductModel(
        id: json["id"].toString(),
        title: json["title"],
        amount: double.parse(json["amount"].toString()),
        imageUrl: json["image_url"],
      );
    }).toList();

    emit(state.copyWith(
      homeScreenState: HomeScreenState.success,
      products: products,
    ));
  }

  void _onAddToCartEvent(AddToCartEvent event, Emitter<EcommerceState> emit) {
    final List<ProductModel> newCart = [];

    // final exist = state.cart.firstWhere(
    //   (p) => p.id == event.product.id,
    //   orElse: () => event.product.copyWith(quantity: 0),
    // );

    // final updateCart = state.cart.map((p) {
    //   if (p.id == event.product.id) {
    //     return p.copyWith(quantity: p.quantity + 1);
    //   }
    //   return p;
    // }).toList();

    // if (exist.quantity == 0) {
    //   updateCart.add(event.product.copyWith(quantity: 1));
    // }
    newCart.add(event.product);

    emit(state.copyWith(cart: newCart));
    log(state.cart.toString());
    log(state.cart.length.toString());
  }

  // void _onAddToCartEvent(AddToCartEvent event, Emitter<EcommerceState> emit) {
  //   // Crea una copia del carrito existente.
  //   final List<ProductModel> newCart = List.from(state.cart);

  //   // Verifica si el producto ya existe en el carrito.
  //   final productIndex = newCart.indexWhere((p) => p.id == event.product.id);

  //   if (productIndex != -1) {
  //     // Si ya existe, actualiza su cantidad.
  //     final updatedProduct = newCart[productIndex].copyWith(
  //       quantity: newCart[productIndex].quantity + 1,
  //     );
  //     newCart[productIndex] = updatedProduct;
  //   } else {
  //     // Si no existe, agrega el producto con cantidad inicial 1.
  //     newCart.add(event.product.copyWith(quantity: 1));
  //   }

  //   // Emite el nuevo estado con el carrito actualizado.
  //   emit(state.copyWith(cart: newCart));

  //   // Logs para depuración.
  //   log("Carrito actualizado: ${state.cart}");
  //   log("Cantidad de productos en el carrito: ${state.cart.length}");
  // }

  void _onUpdateQuantityEvent(
      UpdateQuantityEvent event, Emitter<EcommerceState> emit) {}

  void _onRemoveFromCartEvent(
      RemoveFromCartEvent event, Emitter<EcommerceState> emit) {}
}
