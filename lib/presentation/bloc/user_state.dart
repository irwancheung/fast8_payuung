part of 'user_bloc.dart';

class UserState extends BlocState {
  const UserState({super.state, super.errorMessage});
}

class GetUserDetailsState extends UserState {
  final User? user;

  const GetUserDetailsState({this.user, super.state, super.errorMessage});

  @override
  List<Object?> get props => [user, super.state, super.errorMessage];
}

class UpdateUserProfileState extends UserState {
  final User? user;

  const UpdateUserProfileState({this.user, super.state, super.errorMessage});

  @override
  List<Object?> get props => [user, super.state, super.errorMessage];
}

class UpdateUserAddressState extends UserState {
  final User? user;

  const UpdateUserAddressState({this.user, super.state, super.errorMessage});

  @override
  List<Object?> get props => [user, super.state, super.errorMessage];
}

class UpdateUserEmploymentOrBusinessState extends UserState {
  final User? user;

  const UpdateUserEmploymentOrBusinessState({this.user, super.state, super.errorMessage});

  @override
  List<Object?> get props => [user, super.state, super.errorMessage];
}
