import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String title;
  final double amount;
  final String imageUrl;
  final int quantity;

  const ProductModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.imageUrl,
    this.quantity = 1,
  });

  ProductModel copyWith(
      {String? id,
      String? title,
      double? amount,
      String? imageUrl,
      int? quantity}) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        amount,
        imageUrl,
        quantity,
      ];
}
