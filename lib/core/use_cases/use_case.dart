import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppException, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
