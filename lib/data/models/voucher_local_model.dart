import 'dart:convert';

import 'package:fast8_payuung/domain/entities/voucher.dart';

class VoucherLocalModel extends Voucher {
  const VoucherLocalModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.amount,
    required super.price,
    required super.discountPercentage,
    required super.category,
    required super.soldCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'amount': amount,
      'price': price,
      'discountPercentage': discountPercentage,
      'category': category,
      'soldCount': soldCount,
    };
  }

  factory VoucherLocalModel.fromMap(Map<String, dynamic> map) {
    return VoucherLocalModel(
      id: map['id'] as int,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      amount: map['amount'] as int,
      price: map['price'] as int,
      discountPercentage: map['discountPercentage'] as int,
      category: map['category'] as String,
      soldCount: map['soldCount'] as int,
    );
  }

  factory VoucherLocalModel.fromJson(String source) =>
      VoucherLocalModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  String toJson() => jsonEncode(toMap());
}
