import 'dart:convert';

import 'package:fast8_payuung/data/models/address_local_model.dart';
import 'package:fast8_payuung/data/models/employment_or_business_local_model.dart';
import 'package:fast8_payuung/domain/entities/user.dart';

class UserLocalModel extends User {
  const UserLocalModel({
    required super.name,
    required super.dob,
    required super.gender,
    required super.email,
    required super.phone,
    required super.education,
    required super.maritalStatus,
    required super.idCardImageBase64,
    required super.idCardNo,
    required super.idCardAddress,
    required super.residenceAddress,
    required super.isResidenceAddressSameAsIdCard,
    required super.employmentOrBusiness,
  });

  factory UserLocalModel.empty() {
    return UserLocalModel(
      name: '',
      dob: DateTime.utc(1970),
      gender: 'Laki-laki',
      email: '',
      phone: '',
      education: 'SD',
      maritalStatus: 'Belum Kawin',
      idCardImageBase64: '',
      idCardNo: '',
      idCardAddress: AddressLocalModel.empty(),
      residenceAddress: AddressLocalModel.empty(),
      isResidenceAddressSameAsIdCard: true,
      employmentOrBusiness: EmploymentOrBusinessLocalModel.empty(),
    );
  }

  UserLocalModel copyWith({
    String? name,
    DateTime? dob,
    String? gender,
    String? email,
    String? phone,
    String? education,
    String? maritalStatus,
    String? idCardImageBase64,
    String? idCardNo,
    AddressLocalModel? idCardAddress,
    AddressLocalModel? residenceAddress,
    bool? isResidenceAddressSameAsIdCard,
    EmploymentOrBusinessLocalModel? employmentOrBusiness,
  }) {
    return UserLocalModel(
      name: name ?? this.name,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      education: education ?? this.education,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      idCardImageBase64: idCardImageBase64 ?? this.idCardImageBase64,
      idCardNo: idCardNo ?? this.idCardNo,
      idCardAddress: idCardAddress ?? this.idCardAddress,
      residenceAddress: residenceAddress ?? this.residenceAddress,
      isResidenceAddressSameAsIdCard: isResidenceAddressSameAsIdCard ?? this.isResidenceAddressSameAsIdCard,
      employmentOrBusiness: employmentOrBusiness ?? this.employmentOrBusiness,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dob': dob.millisecondsSinceEpoch,
      'gender': gender,
      'email': email,
      'phone': phone,
      'education': education,
      'maritalStatus': maritalStatus,
      'idCardImageBase64': idCardImageBase64,
      'idCardNo': idCardNo,
      'idCardAddress': AddressLocalModel.fromEntity(idCardAddress).toMap(),
      'residenceAddress': AddressLocalModel.fromEntity(residenceAddress).toMap(),
      'isResidenceAddressSameAsIdCard': isResidenceAddressSameAsIdCard,
      'employmentOrBusiness': EmploymentOrBusinessLocalModel.fromEntity(employmentOrBusiness).toMap(),
    };
  }

  factory UserLocalModel.fromMap(Map<String, dynamic> map) {
    return UserLocalModel(
      name: map['name'] as String,
      dob: DateTime.fromMillisecondsSinceEpoch(map['dob'] as int),
      gender: map['gender'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      education: map['education'] as String,
      maritalStatus: map['maritalStatus'] as String,
      idCardImageBase64: map['idCardImageBase64'] as String,
      idCardNo: map['idCardNo'] as String,
      idCardAddress: AddressLocalModel.fromMap(map['idCardAddress'] as Map<String, dynamic>),
      residenceAddress: AddressLocalModel.fromMap(map['residenceAddress'] as Map<String, dynamic>),
      isResidenceAddressSameAsIdCard: map['isResidenceAddressSameAsIdCard'] as bool,
      employmentOrBusiness: EmploymentOrBusinessLocalModel.fromMap(map['employmentOrBusiness'] as Map<String, dynamic>),
    );
  }

  factory UserLocalModel.fromJson(String source) => UserLocalModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  String toJson() => jsonEncode(toMap());
}
