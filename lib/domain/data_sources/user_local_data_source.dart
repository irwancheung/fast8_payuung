import 'package:fast8_payuung/data/models/user_local_model.dart';

abstract class UserLocalDataSource {
  Future<UserLocalModel> getUser();
  Future<void> setUser(UserLocalModel user);
  Future<UserLocalModel> updateUserProfile({
    required String name,
    required DateTime dob,
    required String gender,
    required String email,
    required String phone,
    required String education,
    required String maritalStatus,
  });
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
  });
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
  });
}
