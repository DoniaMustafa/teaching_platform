import 'package:teaching/core/export/export.dart';

abstract class RateDataSource {
  Future<ResponseModel> addRate({int? videoId, int? rate});
}

class RateWithServer extends RateDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> addRate({int? videoId, int? rate}) async =>
      remoteExecute(
          request: dioConsumer.postRequest(
              path: EndPoints.addRate,
              body: {"CourseVideoId": videoId, "Rate": rate}),
          fromJsonFunction: ResponseModel.fromJson);

  RateWithServer(this.dioConsumer);
}
