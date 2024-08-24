part of 'voucher_bloc.dart';

class VoucherState extends BlocState {
  const VoucherState({super.state, super.errorMessage});
}

class GetVouchersState extends VoucherState {
  final List<Voucher>? vouchers;

  const GetVouchersState({this.vouchers, super.state, super.errorMessage});
}
