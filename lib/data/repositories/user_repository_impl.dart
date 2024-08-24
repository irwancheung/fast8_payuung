import 'package:dartz/dartz.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/domain/data_sources/user_local_data_source.dart';
import 'package:fast8_payuung/domain/entities/user.dart';
import 'package:fast8_payuung/domain/repositories/user_repository.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_address.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_address_employment_or_business.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_profile.dart';
import 'package:fast8_payuung/global_vars.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<Either<AppException, User>> getUserDetails() async {
    try {
      final user = await _dataSource.getUser();

      return right(user);
    } catch (e, s) {
      return left(appException.handle(e, s));
    }
  }

  @override
  Future<Either<AppException, User>> updateUserProfile(UpdateUserProfileParams params) async {
    try {
      final user = await _dataSource.updateUserProfile(
        name: params.name,
        email: params.email,
        phone: params.phone,
        dob: params.dob,
        gender: params.gender,
        education: params.education,
        maritalStatus: params.maritalStatus,
      );

      return right(user);
    } catch (e, s) {
      return left(appException.handle(e, s));
    }
  }

  @override
  Future<Either<AppException, User>> updateUserAddress(UpdateUserAddressParams params) async {
    try {
      final user = await _dataSource.updateUserAddress(
        idCardImageBase64: params.idCardImageBase64,
        idCardNo: params.idCardNo,
        idCardStreet: params.idCardStreet,
        idCardProvince: params.idCardProvince,
        idCardCity: params.idCardCity,
        idCardDistrict: params.idCardDistrict,
        idCardSubDistrict: params.idCardSubDistrict,
        idCardPostalCode: params.idCardPostalCode,
        residenceStreet: params.residenceStreet,
        residenceProvince: params.residenceProvince,
        residenceCity: params.residenceCity,
        residenceDistrict: params.residenceDistrict,
        residenceSubDistrict: params.residenceSubDistrict,
        residencePostalCode: params.residencePostalCode,
        isResidenceAddressSameAsIdCard: params.isResidenceAddressSameAsIdCard,
      );

      return right(user);
    } catch (e, s) {
      return left(appException.handle(e, s));
    }
  }

  @override
  Future<Either<AppException, User>> updateUserEmploymentOrBusiness(UpdateUserEmploymentOrBusinessParams params) async {
    try {
      final user = await _dataSource.updateUserEmploymentOrBusiness(
        name: params.name,
        address: params.address,
        occupationLevel: params.occupationLevel,
        lengthOfService: params.lengthOfService,
        sourceOfIncome: params.sourceOfIncome,
        grossAnnualIncome: params.grossAnnualIncome,
        bankAccountName: params.bankAccountName,
        bankAccountNumber: params.bankAccountNumber,
        bankName: params.bankName,
        bankBranchName: params.bankBranchName,
      );

      return right(user);
    } catch (e, s) {
      return left(appException.handle(e, s));
    }
  }
}
