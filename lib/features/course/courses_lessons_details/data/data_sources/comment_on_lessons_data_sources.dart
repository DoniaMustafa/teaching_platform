import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';

import '../../../../../core/export/export.dart';

abstract class CommentOnLessonsDataSources {
  Future<ResponseModel> addCommentOnVideo(
      {required int videoId, required String comment, bool isCourse = true});
}

class CommentOnLessonsWithServer extends CommentOnLessonsDataSources {
  CommentOnLessonsWithServer(this.dioConsumer);

  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> addCommentOnVideo(
          {required int videoId,
          required String comment,
          bool isCourse = true}) async =>
      remoteExecute(
          request: dioConsumer.postRequest(
              path: isCourse.isTrue
                  ? EndPoints.addCourseVideoComment
                  : EndPoints.addGroupVideoComment,
              body: {
                if (isCourse.isTrue) "CourseVideoId": videoId,
                if (isCourse.isFalse) "GroupVideoId": videoId,
                "Comment": comment
              }),
          fromJsonFunction: CourseLessonDetailsResponseModel.fromJson);
}
