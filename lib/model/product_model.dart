import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String title;
  final double amount;
  final String product;
  final String description;
  final String imageUrl;
  final int quantity;
  final bool addedToCart;

  const ProductModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.product,
    required this.description,
    required this.imageUrl,
    this.quantity = 0,
    this.addedToCart = false,
  });

  ProductModel copyWith(
      {String? id,
      String? title,
      double? amount,
      String? product,
      String? description,
      String? imageUrl,
      int? quantity,
      bool? addedToCart}) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      product: product ?? this.product,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      addedToCart: addedToCart ?? this.addedToCart,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        amount,
        product,
        description,
        imageUrl,
        quantity,
        addedToCart
      ];
}
