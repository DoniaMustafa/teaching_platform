class CubitStates {}

class InitialState extends CubitStates {}

class LoadingState extends CubitStates {}

class FailedState extends CubitStates {
  String message;
  FailedState({required this.message});
}

class LoadedState<T> extends CubitStates {
  final T data;
  LoadedState({required this.data});
}
