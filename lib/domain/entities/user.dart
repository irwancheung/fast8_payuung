import 'package:equatable/equatable.dart';
import 'package:fast8_payuung/domain/entities/address.dart';
import 'package:fast8_payuung/domain/entities/employment_or_business.dart';

class User extends Equatable {
  final String name;
  final DateTime dob;
  final String gender;
  final String email;
  final String phone;
  final String education;
  final String maritalStatus;
  final String idCardImageBase64;
  final String idCardNo;
  final Address idCardAddress;
  final Address residenceAddress;
  final bool isResidenceAddressSameAsIdCard;
  final EmploymentOrBusiness employmentOrBusiness;

  const User({
    required this.name,
    required this.dob,
    required this.gender,
    required this.email,
    required this.phone,
    required this.education,
    required this.maritalStatus,
    required this.idCardImageBase64,
    required this.idCardNo,
    required this.idCardAddress,
    required this.residenceAddress,
    required this.isResidenceAddressSameAsIdCard,
    required this.employmentOrBusiness,
  });

  @override
  List<Object?> get props => [
        name,
        dob,
        gender,
        email,
        phone,
        education,
        maritalStatus,
        idCardImageBase64,
        idCardNo,
        idCardAddress,
        residenceAddress,
        isResidenceAddressSameAsIdCard,
        employmentOrBusiness,
      ];
}
