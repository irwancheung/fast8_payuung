import 'package:fast8_payuung/domain/entities/bank_account.dart';

class BankAccountLocalModel extends BankAccount {
  const BankAccountLocalModel({
    required super.name,
    required super.number,
    required super.bankName,
    required super.bankBranchName,
  });

  factory BankAccountLocalModel.empty() {
    return const BankAccountLocalModel(
      name: '',
      number: '',
      bankName: '',
      bankBranchName: '',
    );
  }

  factory BankAccountLocalModel.fromEntity(BankAccount bankAccount) {
    return BankAccountLocalModel(
      name: bankAccount.name,
      number: bankAccount.number,
      bankName: bankAccount.bankName,
      bankBranchName: bankAccount.bankBranchName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'bankName': bankName,
      'bankBranchName': bankBranchName,
    };
  }

  factory BankAccountLocalModel.fromMap(Map<String, dynamic> map) {
    return BankAccountLocalModel(
      name: map['name'] as String,
      number: map['number'] as String,
      bankName: map['bankName'] as String,
      bankBranchName: map['bankBranchName'] as String,
    );
  }
}
