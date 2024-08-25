import 'package:dartz/dartz.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/domain/entities/voucher.dart';
import 'package:fast8_payuung/domain/use_cases/get_vouchers.dart';

abstract class VoucherRepository {
  Future<Either<AppException, List<Voucher>>> getVouchers(GetVouchersParams params);
}
