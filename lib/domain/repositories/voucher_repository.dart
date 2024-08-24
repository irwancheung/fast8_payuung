import 'package:dartz/dartz.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/domain/entities/voucher.dart';

abstract class VoucherRepository {
  Future<Either<AppException, List<Voucher>>> getVouchers();
}
