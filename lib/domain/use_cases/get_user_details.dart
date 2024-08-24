import 'package:dartz/dartz.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/core/use_cases/use_case.dart';
import 'package:fast8_payuung/domain/entities/user.dart';
import 'package:fast8_payuung/domain/repositories/user_repository.dart';

class GetUserDetails implements UseCase<User, NoParams> {
  final UserRepository _repository;

  const GetUserDetails(this._repository);

  @override
  Future<Either<AppException, User>> call(NoParams params) => _repository.getUserDetails();
}
