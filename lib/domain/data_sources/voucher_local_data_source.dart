import 'package:fast8_payuung/data/models/voucher_local_model.dart';

abstract class VoucherLocalDataSource {
  Future<List<VoucherLocalModel>> getVouchers();
  Future<void> setVouchers(List<VoucherLocalModel> vouchers);
}
