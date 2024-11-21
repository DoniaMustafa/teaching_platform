part of 'lessons_details_cubit.dart';

@immutable
abstract class LessonsDetailsState {}

class LessonsDetailsInitial extends LessonsDetailsState {}
class LessonsDetailsLoadingState extends LessonsDetailsState {}
class LessonsDetailsLoadedState extends LessonsDetailsState {
   final CourseLessonDataMode data;

   LessonsDetailsLoadedState({required this.data});

}
class LessonsDetailsErrorState extends LessonsDetailsState {
  final String message;

  LessonsDetailsErrorState({required this.message});
}



// class VimeoVideoLoadingState extends LessonsDetailsState {}
//
// class VimeoVideoLoadedState extends LessonsDetailsState {
//   final VimeoVideoData data;
//
//   VimeoVideoLoadedState({required this.data});
//
// }
// class VimeoVideoErrorState extends LessonsDetailsState {
//   final String message;
//
//   VimeoVideoErrorState({required this.message});
// }
