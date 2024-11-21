import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/data/models/vimeo_video_response_model.dart';

import '../../../../../core/export/export.dart';

abstract class LessonsDetailsDataSources {
  Future<ResponseModel> getLessonsDetails({required int lessonId});
  Future<ResponseModel> getVimeoVideo({required int vimeoId});

}

class LessonsDetailsWithServer extends LessonsDetailsDataSources {
  LessonsDetailsWithServer(this.dioConsumer);

  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> getLessonsDetails({required int lessonId}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getCourseLessonDetails,
              queryParams: {"courseLessonId": lessonId}),
          fromJsonFunction: CourseLessonDetailsResponseModel.fromJson);

  @override
  Future<ResponseModel> getVimeoVideo({required int vimeoId}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getVimeoVideoDetails,
              queryParams: {"VideoId": vimeoId}),
          fromJsonFunction: VimeoVideoResponseModel.fromJson);
}
