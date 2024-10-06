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




