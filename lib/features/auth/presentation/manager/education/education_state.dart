part of 'education_cubit.dart';

@immutable
abstract class EducationState {}

class EducationInitial extends EducationState {}
class EducationTypeLoadingState extends EducationState {}
class EducationTypeLoadedState extends EducationState {
  List<PublicDataModel>data=[];

  EducationTypeLoadedState({required this.data});
}
class EducationTypeFailureState extends EducationState {
  final String message;
  EducationTypeFailureState({required this.message});

}


// class EducationProgramsLoadingState extends EducationState {}
// class EducationProgramsLoadedState extends EducationState {
//   List<PublicDataModel>data=[];
//
//   EducationProgramsLoadedState({required this.data});
// }
// class EducationProgramsFailureState extends EducationState {
//   final String message;
//   EducationProgramsFailureState({required this.message});
//
// }
//
// class GradeLoadingState extends EducationState {}
// class GradeLoadedState extends EducationState {
//   List<PublicDataModel>data=[];
//
//   GradeLoadedState({required this.data});
// }
// class GradeFailureState extends EducationState {
//   final String message;
//   GradeFailureState({required this.message});
//
// }


