import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/core/use_cases/use_case.dart';
import 'package:fast8_payuung/domain/entities/user.dart';
import 'package:fast8_payuung/domain/repositories/user_repository.dart';

class UpdateUserAddress implements UseCase<User, UpdateUserAddressParams> {
  final UserRepository _repository;

  UpdateUserAddress(this._repository);

  @override
  Future<Either<AppException, User>> call(UpdateUserAddressParams params) => _repository.updateUserAddress(params);
}

class UpdateUserAddressParams extends Equatable {
  final String idCardImageBase64;
  final String idCardNo;
  final String idCardStreet;
  final String idCardProvince;
  final String idCardCity;
  final String idCardDistrict;
  final String idCardSubDistrict;
  final String idCardPostalCode;
  final String residenceStreet;
  final String residenceProvince;
  final String residenceCity;
  final String residenceDistrict;
  final String residenceSubDistrict;
  final String residencePostalCode;
  final bool isResidenceAddressSameAsIdCard;

  const UpdateUserAddressParams({
    required this.idCardImageBase64,
    required this.idCardNo,
    required this.idCardStreet,
    required this.idCardProvince,
    required this.idCardCity,
    required this.idCardDistrict,
    required this.idCardSubDistrict,
    required this.idCardPostalCode,
    required this.residenceStreet,
    required this.residenceProvince,
    required this.residenceCity,
    required this.residenceDistrict,
    required this.residenceSubDistrict,
    required this.residencePostalCode,
    required this.isResidenceAddressSameAsIdCard,
  });

  @override
  List<Object?> get props => [
        idCardImageBase64,
        idCardNo,
        idCardStreet,
        idCardProvince,
        idCardCity,
        idCardDistrict,
        idCardSubDistrict,
        idCardPostalCode,
        residenceStreet,
        residenceProvince,
        residenceCity,
        residenceDistrict,
        residenceSubDistrict,
        residencePostalCode,
        isResidenceAddressSameAsIdCard,
      ];
}
