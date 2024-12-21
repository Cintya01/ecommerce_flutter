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
        product: json["product"],
        description: json["description"],
        imageUrl: json["image_url"],
      );
    }).toList();

    emit(state.copyWith(
      homeScreenState: HomeScreenState.sucess,
      products: products,
    ));
  }

  void _onAddToCartEvent(AddToCartEvent event, Emitter<EcommerceState> emit) {}

  void _onUpdateQuantityEvent(
      UpdateQuantityEvent event, Emitter<EcommerceState> emit) {}

  void _onRemoveFromCartEvent(
      RemoveFromCartEvent event, Emitter<EcommerceState> emit) {}
}
