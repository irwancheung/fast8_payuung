import 'package:equatable/equatable.dart';
import 'package:fast8_payuung/domain/entities/bank_account.dart';

class EmploymentOrBusiness extends Equatable {
  final String name;
  final String address;
  final String occupationLevel;
  final String lengthOfService;
  final String sourceOfIncome;
  final String grossAnnualIncome;
  final BankAccount bankAccount;

  const EmploymentOrBusiness({
    required this.name,
    required this.address,
    required this.occupationLevel,
    required this.lengthOfService,
    required this.sourceOfIncome,
    required this.grossAnnualIncome,
    required this.bankAccount,
  });

  @override
  List<Object?> get props => [
        name,
        address,
        occupationLevel,
        lengthOfService,
        sourceOfIncome,
        grossAnnualIncome,
        bankAccount,
      ];
}
