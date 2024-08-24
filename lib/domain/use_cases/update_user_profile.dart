import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/core/use_cases/use_case.dart';
import 'package:fast8_payuung/domain/entities/user.dart';
import 'package:fast8_payuung/domain/repositories/user_repository.dart';

class UpdateUserProfile implements UseCase<User, UpdateUserProfileParams> {
  final UserRepository _repository;

  UpdateUserProfile(this._repository);

  @override
  Future<Either<AppException, User>> call(UpdateUserProfileParams params) => _repository.updateUserProfile(params);
}

class UpdateUserProfileParams extends Equatable {
  final String name;
  final DateTime dob;
  final String gender;
  final String email;
  final String phone;
  final String education;
  final String maritalStatus;

  const UpdateUserProfileParams({
    required this.name,
    required this.dob,
    required this.gender,
    required this.email,
    required this.phone,
    required this.education,
    required this.maritalStatus,
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
      ];
}
