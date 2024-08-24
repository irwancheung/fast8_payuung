import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String street;
  final String province;
  final String city;
  final String district;
  final String subDistrict;
  final String postalCode;

  const Address({
    required this.street,
    required this.province,
    required this.city,
    required this.district,
    required this.subDistrict,
    required this.postalCode,
  });

  @override
  List<Object?> get props => [
        street,
        province,
        city,
        district,
        subDistrict,
        postalCode,
      ];
}
