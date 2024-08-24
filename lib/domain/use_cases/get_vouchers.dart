import 'package:dartz/dartz.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/core/use_cases/use_case.dart';
import 'package:fast8_payuung/domain/entities/voucher.dart';
import 'package:fast8_payuung/domain/repositories/voucher_repository.dart';

class GetVouchers implements UseCase<List<Voucher>, NoParams> {
  final VoucherRepository _voucherRepository;

  const GetVouchers(this._voucherRepository);

  @override
  Future<Either<AppException, List<Voucher>>> call(NoParams params) => _voucherRepository.getVouchers();
}
