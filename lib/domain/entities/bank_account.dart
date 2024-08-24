import 'package:equatable/equatable.dart';

class BankAccount extends Equatable {
  final String name;
  final String number;
  final String bankName;
  final String bankBranchName;

  const BankAccount({
    required this.name,
    required this.number,
    required this.bankName,
    required this.bankBranchName,
  });

  @override
  List<Object?> get props => [name, number, bankName, bankBranchName];
}
