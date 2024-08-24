import 'package:dartz/dartz.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/domain/entities/user.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_address.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_address_employment_or_business.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_profile.dart';

abstract class UserRepository {
  Future<Either<AppException, User>> getUserDetails();
  Future<Either<AppException, User>> updateUserProfile(UpdateUserProfileParams params);
  Future<Either<AppException, User>> updateUserAddress(UpdateUserAddressParams params);
  Future<Either<AppException, User>> updateUserEmploymentOrBusiness(UpdateUserEmploymentOrBusinessParams params);
}
