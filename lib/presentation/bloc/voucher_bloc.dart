import 'package:bloc/bloc.dart';
import 'package:fast8_payuung/core/blocs/bloc_event_state.dart';
import 'package:fast8_payuung/domain/entities/voucher.dart';
import 'package:fast8_payuung/domain/use_cases/get_vouchers.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final GetVouchers _getVouchers;

  VoucherBloc({
    required GetVouchers getVouchers,
  })  : _getVouchers = getVouchers,
        super(const VoucherState()) {
    on<GetVouchersEvent>(_onGetVouchers);
  }

  Future<void> _onGetVouchers(GetVouchersEvent event, Emitter<VoucherState> emit) async {
    emit(const GetVouchersState(state: State.loading));

    final result = await _getVouchers(event.params);

    result.fold(
      (e) => emit(GetVouchersState(state: State.error, errorMessage: e.message)),
      (vouchers) => emit(GetVouchersState(state: State.loaded, vouchers: vouchers)),
    );
  }
}
