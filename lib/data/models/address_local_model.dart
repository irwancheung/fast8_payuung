import 'dart:convert';

import 'package:fast8_payuung/domain/entities/address.dart';

class AddressLocalModel extends Address {
  const AddressLocalModel({
    required super.street,
    required super.province,
    required super.city,
    required super.district,
    required super.subDistrict,
    required super.postalCode,
  });

  factory AddressLocalModel.empty() {
    return const AddressLocalModel(
      street: '',
      province: '',
      city: '',
      district: '',
      subDistrict: '',
      postalCode: '',
    );
  }

  factory AddressLocalModel.fromEntity(Address address) {
    return AddressLocalModel(
      street: address.street,
      province: address.province,
      city: address.city,
      district: address.district,
      subDistrict: address.subDistrict,
      postalCode: address.postalCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'province': province,
      'city': city,
      'district': district,
      'subDistrict': subDistrict,
      'postalCode': postalCode,
    };
  }

  factory AddressLocalModel.fromMap(Map<String, dynamic> map) {
    return AddressLocalModel(
      street: map['street'] as String,
      province: map['province'] as String,
      city: map['city'] as String,
      district: map['district'] as String,
      subDistrict: map['subDistrict'] as String,
      postalCode: map['postalCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressLocalModel.fromJson(String source) =>
      AddressLocalModel.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
