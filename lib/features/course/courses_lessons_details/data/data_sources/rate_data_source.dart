import 'package:teaching/core/export/export.dart';

abstract class RateDataSource {
  Future<ResponseModel> addRate(
      {int? videoId, int? rate, bool isCourse = true});
}

class RateWithServer extends RateDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> addRate(
          {int? videoId, int? rate, bool isCourse = true}) async =>
      remoteExecute(
          request: dioConsumer.postRequest(
              path: isCourse.isTrue
                  ? EndPoints.addCourseVideoRate
                  : EndPoints.addGroupVideoRate,
              body: {
                if (isCourse.isTrue) "CourseVideoId": videoId,
                if (isCourse.isFalse) "GroupVideoId": videoId,
                "Rate": rate,
              }),
          fromJsonFunction: ResponseModel.fromJson);

  RateWithServer(this.dioConsumer);
}
