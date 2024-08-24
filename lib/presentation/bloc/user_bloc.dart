import 'package:bloc/bloc.dart';
import 'package:fast8_payuung/core/blocs/bloc_event_state.dart';
import 'package:fast8_payuung/core/use_cases/use_case.dart';
import 'package:fast8_payuung/domain/entities/user.dart';
import 'package:fast8_payuung/domain/use_cases/get_user_details.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_address.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_address_employment_or_business.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_profile.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserDetails _getUserDetails;
  final UpdateUserProfile _updateUserProfile;
  final UpdateUserAddress _updateUserAddress;
  final UpdateUserEmploymentOrBusiness _updateUserEmploymentOrBusiness;

  UserBloc({
    required GetUserDetails getUserDetails,
    required UpdateUserProfile updateUserProfile,
    required UpdateUserAddress updateUserAddress,
    required UpdateUserEmploymentOrBusiness updateUserEmploymentOrBusiness,
  })  : _getUserDetails = getUserDetails,
        _updateUserProfile = updateUserProfile,
        _updateUserAddress = updateUserAddress,
        _updateUserEmploymentOrBusiness = updateUserEmploymentOrBusiness,
        super(const UserState()) {
    on<GetUserDetailsEvent>(_onGetUserDetails);
    on<UpdateUserProfileEvent>(_onUpdateUserProfile);
    on<UpdateUserAddressEvent>(_onUpdateUserAddress);
    on<UpdateUserEmploymentOrBusinessEvent>(_onUpdateUserEmploymentOrBusiness);
  }

  Future<void> _onGetUserDetails(GetUserDetailsEvent event, Emitter<UserState> emit) async {
    emit(const GetUserDetailsState(state: State.loading));

    final result = await _getUserDetails(NoParams());

    result.fold(
      (e) => emit(GetUserDetailsState(state: State.error, errorMessage: e.message)),
      (user) => emit(GetUserDetailsState(state: State.loaded, user: user)),
    );
  }

  Future<void> _onUpdateUserProfile(UpdateUserProfileEvent event, Emitter<UserState> emit) async {
    emit(const UpdateUserProfileState(state: State.loading));

    final result = await _updateUserProfile(event.params);

    result.fold(
      (e) => emit(UpdateUserProfileState(state: State.error, errorMessage: e.message)),
      (user) => emit(UpdateUserProfileState(state: State.loaded, user: user)),
    );
  }

  Future<void> _onUpdateUserAddress(UpdateUserAddressEvent event, Emitter<UserState> emit) async {
    emit(const UpdateUserAddressState(state: State.loading));

    final result = await _updateUserAddress(event.params);

    result.fold(
      (e) => emit(UpdateUserAddressState(state: State.error, errorMessage: e.message)),
      (user) => emit(UpdateUserAddressState(state: State.loaded, user: user)),
    );
  }

  Future<void> _onUpdateUserEmploymentOrBusiness(
    UpdateUserEmploymentOrBusinessEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UpdateUserEmploymentOrBusinessState(state: State.loading));

    final result = await _updateUserEmploymentOrBusiness(event.params);

    result.fold(
      (e) => emit(UpdateUserEmploymentOrBusinessState(state: State.error, errorMessage: e.message)),
      (user) => emit(UpdateUserEmploymentOrBusinessState(state: State.loaded, user: user)),
    );
  }
}
