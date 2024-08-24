import 'package:fast8_payuung/core/storages/local_storage.dart';
import 'package:fast8_payuung/data/models/address_local_model.dart';
import 'package:fast8_payuung/data/models/bank_account_local_model.dart';
import 'package:fast8_payuung/data/models/employment_or_business_local_model.dart';
import 'package:fast8_payuung/data/models/user_local_model.dart';
import 'package:fast8_payuung/domain/data_sources/user_local_data_source.dart';

class UserLocalDataSourceImpls implements UserLocalDataSource {
  final LocalStorage _storage;

  UserLocalDataSourceImpls(this._storage);

  @override
  Future<UserLocalModel> getUser() async {
    final userJson = _storage.getUser();

    if (userJson == null) {
      final emptyUser = UserLocalModel.empty();
      await setUser(emptyUser);
      return emptyUser;
    }

    return UserLocalModel.fromJson(userJson);
  }

  @override
  Future<void> setUser(UserLocalModel user) async {
    final success = await _storage.setUser(user.toJson());

    if (!success) throw Exception('Gagal menyimpan user');
  }

  @override
  Future<UserLocalModel> updateUserProfile({
    required String name,
    required DateTime dob,
    required String gender,
    required String email,
    required String phone,
    required String education,
    required String maritalStatus,
  }) async {
    final user = await getUser();

    final updatedUser = user.copyWith(
      name: name,
      dob: dob,
      gender: gender,
      email: email,
      phone: phone,
      education: education,
      maritalStatus: maritalStatus,
    );

    await setUser(updatedUser);

    return updatedUser;
  }

  @override
  Future<UserLocalModel> updateUserAddress({
    required String idCardImageBase64,
    required String idCardNo,
    required String idCardStreet,
    required String idCardProvince,
    required String idCardCity,
    required String idCardDistrict,
    required String idCardSubDistrict,
    required String idCardPostalCode,
    required String residenceStreet,
    required String residenceProvince,
    required String residenceCity,
    required String residenceDistrict,
    required String residenceSubDistrict,
    required String residencePostalCode,
    required bool isResidenceAddressSameAsIdCard,
  }) async {
    final user = await getUser();

    final updatedUser = user.copyWith(
      idCardImageBase64: idCardImageBase64,
      idCardNo: idCardNo,
      idCardAddress: AddressLocalModel(
        street: idCardStreet,
        province: idCardProvince,
        city: idCardCity,
        district: idCardDistrict,
        subDistrict: idCardSubDistrict,
        postalCode: idCardPostalCode,
      ),
      residenceAddress: AddressLocalModel(
        street: residenceStreet,
        province: residenceProvince,
        city: residenceCity,
        district: residenceDistrict,
        subDistrict: residenceSubDistrict,
        postalCode: residencePostalCode,
      ),
      isResidenceAddressSameAsIdCard: isResidenceAddressSameAsIdCard,
    );

    await setUser(updatedUser);

    return updatedUser;
  }

  @override
  Future<UserLocalModel> updateUserEmploymentOrBusiness({
    required String name,
    required String address,
    required String occupationLevel,
    required String lengthOfService,
    required String sourceOfIncome,
    required String grossAnnualIncome,
    required String bankAccountName,
    required String bankAccountNumber,
    required String bankName,
    required String bankBranchName,
  }) async {
    final user = await getUser();

    final updatedUser = user.copyWith(
      employmentOrBusiness: EmploymentOrBusinessLocalModel(
        name: name,
        address: address,
        occupationLevel: occupationLevel,
        lengthOfService: lengthOfService,
        sourceOfIncome: sourceOfIncome,
        grossAnnualIncome: grossAnnualIncome,
        bankAccount: BankAccountLocalModel(
          name: bankAccountName,
          number: bankAccountNumber,
          bankName: bankName,
          bankBranchName: bankBranchName,
        ),
      ),
    );

    await setUser(updatedUser);

    return updatedUser;
  }
}
