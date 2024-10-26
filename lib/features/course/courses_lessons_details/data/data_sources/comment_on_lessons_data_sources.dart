import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';

import '../../../../../core/export/export.dart';


abstract class CommentOnLessonsDataSources {
  Future<ResponseModel> addCommentOnVideo({required int videoId,required String comment});
}

class CommentOnLessonsWithServer extends CommentOnLessonsDataSources {
  CommentOnLessonsWithServer(this.dioConsumer);

  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> addCommentOnVideo({required int videoId,required String comment}) async =>
      remoteExecute(
          request: dioConsumer.postRequest(
              path: EndPoints.addCourseVideoComment,
              body: {
                "CourseVideoId": videoId,
                "Comment": comment
              }),
          fromJsonFunction: CourseLessonDetailsResponseModel.fromJson);
}
