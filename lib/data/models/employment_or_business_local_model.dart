import 'package:fast8_payuung/data/models/bank_account_local_model.dart';
import 'package:fast8_payuung/domain/entities/employment_or_business.dart';

class EmploymentOrBusinessLocalModel extends EmploymentOrBusiness {
  const EmploymentOrBusinessLocalModel({
    required super.name,
    required super.address,
    required super.occupationLevel,
    required super.lengthOfService,
    required super.sourceOfIncome,
    required super.grossAnnualIncome,
    required super.bankAccount,
  });

  factory EmploymentOrBusinessLocalModel.empty() {
    return EmploymentOrBusinessLocalModel(
      name: '',
      address: '',
      occupationLevel: '',
      lengthOfService: '',
      sourceOfIncome: '',
      grossAnnualIncome: '',
      bankAccount: BankAccountLocalModel.empty(),
    );
  }

  factory EmploymentOrBusinessLocalModel.fromEntity(EmploymentOrBusiness entity) {
    return EmploymentOrBusinessLocalModel(
      name: entity.name,
      address: entity.address,
      occupationLevel: entity.occupationLevel,
      lengthOfService: entity.lengthOfService,
      sourceOfIncome: entity.sourceOfIncome,
      grossAnnualIncome: entity.grossAnnualIncome,
      bankAccount: entity.bankAccount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'occupationLevel': occupationLevel,
      'lengthOfService': lengthOfService,
      'sourceOfIncome': sourceOfIncome,
      'grossAnnualIncome': grossAnnualIncome,
      'bankAccount': BankAccountLocalModel.fromEntity(bankAccount).toMap(),
    };
  }

  factory EmploymentOrBusinessLocalModel.fromMap(Map<String, dynamic> map) {
    return EmploymentOrBusinessLocalModel(
      name: map['name'] as String,
      address: map['address'] as String,
      occupationLevel: map['occupationLevel'] as String,
      lengthOfService: map['lengthOfService'] as String,
      sourceOfIncome: map['sourceOfIncome'] as String,
      grossAnnualIncome: map['grossAnnualIncome'] as String,
      bankAccount: BankAccountLocalModel.fromMap(map['bankAccount'] as Map<String, dynamic>),
    );
  }
}
