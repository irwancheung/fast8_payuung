import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/core/use_cases/use_case.dart';
import 'package:fast8_payuung/domain/entities/user.dart';
import 'package:fast8_payuung/domain/repositories/user_repository.dart';

class UpdateUserEmploymentOrBusiness implements UseCase<User, UpdateUserEmploymentOrBusinessParams> {
  final UserRepository _repository;

  UpdateUserEmploymentOrBusiness(this._repository);

  @override
  Future<Either<AppException, User>> call(UpdateUserEmploymentOrBusinessParams params) =>
      _repository.updateUserEmploymentOrBusiness(params);
}

class UpdateUserEmploymentOrBusinessParams extends Equatable {
  final String name;
  final String address;
  final String occupationLevel;
  final String lengthOfService;
  final String sourceOfIncome;
  final String grossAnnualIncome;
  final String bankAccountName;
  final String bankAccountNumber;
  final String bankName;
  final String bankBranchName;

  const UpdateUserEmploymentOrBusinessParams({
    required this.name,
    required this.address,
    required this.occupationLevel,
    required this.lengthOfService,
    required this.sourceOfIncome,
    required this.grossAnnualIncome,
    required this.bankAccountName,
    required this.bankAccountNumber,
    required this.bankName,
    required this.bankBranchName,
  });

  @override
  List<Object?> get props => [
        name,
        address,
        occupationLevel,
        lengthOfService,
        sourceOfIncome,
        grossAnnualIncome,
        bankAccountName,
        bankAccountNumber,
        bankName,
        bankBranchName,
      ];
}
