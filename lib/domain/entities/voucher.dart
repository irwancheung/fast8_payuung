import 'package:equatable/equatable.dart';

class Voucher extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final int amount;
  final int price;
  final int discountPercentage;
  final String category;
  final int soldCount;

  const Voucher({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.amount,
    required this.price,
    required this.discountPercentage,
    required this.category,
    required this.soldCount,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        amount,
        price,
        discountPercentage,
        category,
        soldCount,
      ];
}
