part of 'prgram_cubit.dart';

@immutable
abstract class ProgramState {}

class StageInitial extends ProgramState {}

class EducationProgramsLoadingState extends ProgramState {}
class EducationProgramsLoadedState extends ProgramState {
  List<PublicDataModel>data=[];

  EducationProgramsLoadedState({required this.data});
}
class EducationProgramsFailureState extends ProgramState {
  final String message;
  EducationProgramsFailureState({required this.message});

}