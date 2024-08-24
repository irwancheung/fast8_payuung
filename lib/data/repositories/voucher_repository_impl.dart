import 'package:dartz/dartz.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/domain/data_sources/voucher_local_data_source.dart';
import 'package:fast8_payuung/domain/entities/voucher.dart';
import 'package:fast8_payuung/domain/repositories/voucher_repository.dart';
import 'package:fast8_payuung/global_vars.dart';

class VoucherRepositoryImpl implements VoucherRepository {
  final VoucherLocalDataSource _dataSource;

  VoucherRepositoryImpl(this._dataSource);

  @override
  Future<Either<AppException, List<Voucher>>> getVouchers() async {
    try {
      final vouchers = await _dataSource.getVouchers();

      return right(vouchers);
    } catch (e, s) {
      return left(appException.handle(e, s));
    }
  }
}
