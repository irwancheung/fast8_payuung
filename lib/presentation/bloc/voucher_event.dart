part of 'voucher_bloc.dart';

sealed class VoucherEvent extends BlocEvent {
  const VoucherEvent();
}

class GetVouchersEvent extends VoucherEvent {
  const GetVouchersEvent();
}
