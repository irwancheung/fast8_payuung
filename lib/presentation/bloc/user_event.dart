part of 'user_bloc.dart';

sealed class UserEvent extends BlocEvent {
  const UserEvent();
}

class GetUserDetailsEvent extends UserEvent {
  const GetUserDetailsEvent();
}

class UpdateUserProfileEvent extends UserEvent {
  final UpdateUserProfileParams params;

  const UpdateUserProfileEvent(this.params);

  @override
  List<Object> get props => [params];
}

class UpdateUserAddressEvent extends UserEvent {
  final UpdateUserAddressParams params;

  const UpdateUserAddressEvent(this.params);

  @override
  List<Object> get props => [params];
}

class UpdateUserEmploymentOrBusinessEvent extends UserEvent {
  final UpdateUserEmploymentOrBusinessParams params;

  const UpdateUserEmploymentOrBusinessEvent(this.params);

  @override
  List<Object> get props => [params];
}
