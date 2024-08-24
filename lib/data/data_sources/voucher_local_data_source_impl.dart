import 'dart:convert';

import 'package:fast8_payuung/core/storages/local_storage.dart';
import 'package:fast8_payuung/data/models/voucher_local_model.dart';
import 'package:fast8_payuung/domain/data_sources/voucher_local_data_source.dart';
import 'package:flutter/services.dart' show rootBundle;

class VoucherLocalDataSourceImpl implements VoucherLocalDataSource {
  final LocalStorage _storage;

  const VoucherLocalDataSourceImpl(this._storage);

  @override
  Future<List<VoucherLocalModel>> getVouchers() async {
    final vouchersJson = _storage.getVouchers();

    if (vouchersJson == null) {
      final vouchers = await _getVouchersFromAsset();
      await setVouchers(vouchers);

      return vouchers;
    }

    return List<VoucherLocalModel>.from(
      vouchersJson.map(
        (e) => VoucherLocalModel.fromJson(e),
      ),
    );
  }

  @override
  Future<void> setVouchers(List<VoucherLocalModel> vouchers) async {
    final vouchersJson = vouchers.map((e) => e.toJson()).toList();
    final success = await _storage.setVouchers(vouchersJson);

    if (!success) throw Exception('Gagal menyimpan voucher');
  }

  Future<List<VoucherLocalModel>> _getVouchersFromAsset() async {
    final jsonString = await rootBundle.loadString('assets/json/voucher_data.json');
    final jsonData = jsonDecode(jsonString) as List<dynamic>;
    final voucherMaps = jsonData.map((e) => e as Map<String, dynamic>).toList();

    return voucherMaps.map((e) => VoucherLocalModel.fromMap(e)).toList();
  }
}
