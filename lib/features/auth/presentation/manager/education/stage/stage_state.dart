part of 'stage_cubit.dart';

@immutable
abstract class StageState {}

class StageInitial extends StageState {}
class GradeLoadingState extends StageState {}
class GradeLoadedState extends StageState {
  List<PublicDataModel>data=[];

  GradeLoadedState({required this.data});
}
class GradeFailureState extends StageState {
  final String message;
  GradeFailureState({required this.message});

}