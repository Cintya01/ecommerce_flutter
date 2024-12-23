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
    //on<UpdateCartQuantityEvent>(_onUpdateQuantityEvent);
    on<IncreaseQuantityEvent>(_onIncreaseQuantityEvent);
    on<DecreaseQuantityEvent>(_onDecreaseQuantityEvent);
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
    final exist = state.cart.firstWhere(
      (p) => p.id == event.product.id,
      orElse: () => event.product.copyWith(quantity: 0),
    );

    final updateCart = state.cart.map((p) {
      if (p.id == event.product.id) {
        return p.copyWith(quantity: p.quantity + 1);
      }
      return p;
    }).toList();

    if (exist.quantity == 0) {
      updateCart.add(
        event.product.copyWith(quantity: 1),
      );
    }
    emit(state.copyWith(cart: updateCart));
  }

  // void _onUpdateQuantityEvent(
  //     UpdateCartQuantityEvent event, Emitter<EcommerceState> emit) {
  // }

  void _onIncreaseQuantityEvent(
      IncreaseQuantityEvent event, Emitter<EcommerceState> emit) {
    final updateCart = state.cart.map((p) {
      if (p.id == event.product.id) {
        return p.copyWith(quantity: p.quantity + 1);
      }
      return p;
    }).toList();

    emit(state.copyWith(cart: updateCart));
  }

  void _onDecreaseQuantityEvent(
      DecreaseQuantityEvent event, Emitter<EcommerceState> emit) {
    final updateCart = state.cart.map((p) {
      if (p.id == event.product.id && p.quantity > 1) {
        return p.copyWith(quantity: p.quantity - 1);
      }
      return p;
    }).toList();

    emit(state.copyWith(cart: updateCart));
  }

  void _onRemoveFromCartEvent(
      RemoveFromCartEvent event, Emitter<EcommerceState> emit) {
    final updateCart =
        state.cart.where((p) => p.id != event.product.id).toList();
    log(updateCart.toString());
    emit(state.copyWith(cart: updateCart));
  }
}
