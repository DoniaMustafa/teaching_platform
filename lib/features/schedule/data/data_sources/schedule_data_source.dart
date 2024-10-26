import 'package:teaching/core/export/export.dart';

abstract class ScheduleDataSource {
  Future<ResponseModel>getSchedule({required String selectedDay});
  // Future<ResponseModel>getSubscribeCourseDetails({required TeacherModel model});
}

class ScheduleWithServer extends ScheduleDataSource {
  ScheduleWithServer(this.dioConsumer);

  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getSchedule({required String selectedDay})async =>
  remoteExecute(
  request: dioConsumer.getRequest(
  path: EndPoints.getSchedule,

  queryParams: {"selectedDay":selectedDay}),
  fromJsonFunction: GroupDetailsResponseModel.fromJson);

}
