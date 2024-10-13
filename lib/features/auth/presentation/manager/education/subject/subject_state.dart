part of 'subject_cubit.dart';

@immutable
abstract class SubjectState {}

class SubjectInitial extends SubjectState {}
class SubjectLoadingState extends SubjectState {}
class SubjectLoadedState extends SubjectState {

  List<PublicDataModel>data=[];
  SubjectLoadedState({required this.data});
}
class SubjectFailureState extends SubjectState {
                        final String message;
  SubjectFailureState({required this.message});
}
