import 'package:dartz/dartz.dart';
import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/domain/data_sources/voucher_local_data_source.dart';
import 'package:fast8_payuung/domain/entities/voucher.dart';
import 'package:fast8_payuung/domain/repositories/voucher_repository.dart';
import 'package:fast8_payuung/domain/use_cases/get_vouchers.dart';
import 'package:fast8_payuung/global_vars.dart';

class VoucherRepositoryImpl implements VoucherRepository {
  final VoucherLocalDataSource _dataSource;

  VoucherRepositoryImpl(this._dataSource);

  @override
  Future<Either<AppException, List<Voucher>>> getVouchers(GetVouchersParams params) async {
    try {
      final vouchers = await _dataSource.getVouchers();

      switch (params.sortBy) {
        case VouchersSortBy.popularity:
          vouchers.sort((v1, v2) => v2.soldCount.compareTo(v1.soldCount));
        case VouchersSortBy.nameAsc:
          vouchers.sort((v1, v2) => v1.name.toLowerCase().compareTo(v2.name.toLowerCase()));
        case VouchersSortBy.nameDesc:
          vouchers.sort((v1, v2) => v2.name.toLowerCase().compareTo(v1.name.toLowerCase()));
        case VouchersSortBy.priceAsc:
          vouchers.sort((v1, v2) => v1.price.compareTo(v2.price));
        case VouchersSortBy.priceDesc:
          vouchers.sort((v1, v2) => v2.price.compareTo(v1.price));
      }

      return right(vouchers);
    } catch (e, s) {
      return left(appException.handle(e, s));
    }
  }
}
