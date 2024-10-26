import 'package:teaching/features/group/group_lessons_details/data/models/group_Lesson_details_response_model.dart';

import '../../../../../core/export/export.dart';


abstract class GroupLessonsDetailsDataSources {
  Future<ResponseModel> getGroupLessonsDetails({required int lessonId});

}

class GroupLessonsWithServer extends GroupLessonsDetailsDataSources {
  GroupLessonsWithServer(this.dioConsumer);

  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> getGroupLessonsDetails({required int lessonId}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getGroupLessonsDetails,
              queryParams: {"groupId": lessonId}),
          fromJsonFunction: GroupLessonDetailsResponseModel.fromJson);
}
