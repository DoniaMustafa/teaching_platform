

import '../../../../../core/export/export.dart';

abstract class AdsDataSource {
  Future<ResponseModel> getAds();

}
class  AdsWithServer extends AdsDataSource{
  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getAds() async =>  remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.ads,
      ),
      fromJsonFunction: GenericResponseModel.fromJson);

  AdsWithServer(this.dioConsumer);
}