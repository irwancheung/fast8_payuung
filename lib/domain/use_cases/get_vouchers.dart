import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/core/use_cases/use_case.dart';
import 'package:fast8_payuung/domain/entities/voucher.dart';
import 'package:fast8_payuung/domain/repositories/voucher_repository.dart';

enum VouchersSortBy {
  popularity,
  nameAsc,
  nameDesc,
  priceAsc,
  priceDesc,
}

class GetVouchers implements UseCase<List<Voucher>, GetVouchersParams> {
  final VoucherRepository _voucherRepository;

  const GetVouchers(this._voucherRepository);

  @override
  Future<Either<AppException, List<Voucher>>> call(GetVouchersParams params) => _voucherRepository.getVouchers(params);
}

class GetVouchersParams extends Equatable {
  final VouchersSortBy sortBy;

  const GetVouchersParams({required this.sortBy});

  @override
  List<Object?> get props => [sortBy];
}
