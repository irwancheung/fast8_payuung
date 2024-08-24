import 'package:equatable/equatable.dart';

enum State {
  initial,
  loading,
  loaded,
  error,
}

abstract class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

abstract class BlocState extends Equatable {
  final State state;
  final String? errorMessage;

  const BlocState({
    this.state = State.initial,
    this.errorMessage,
  });

  bool get isInitial => state == State.initial;
  bool get isLoading => state == State.loading;
  bool get isLoaded => state == State.loaded;
  bool get isError => state == State.error;

  @override
  List<Object?> get props => [state, errorMessage];
}
