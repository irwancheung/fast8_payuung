import 'package:shared_preferences/shared_preferences.dart';

const userKey = 'user';
const vouchersKey = 'vouchers';

class LocalStorage {
  final SharedPreferences _storage;

  const LocalStorage(this._storage);

  String? getUser() => _storage.getString(userKey);
  Future<bool> setUser(String userJson) async => _storage.setString(userKey, userJson);

  List<String>? getVouchers() => _storage.getStringList(vouchersKey);
  Future<bool> setVouchers(List<String> vouchersJson) async => _storage.setStringList(vouchersKey, vouchersJson);
}
