import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/ads_details/data/models/ads_details_model.dart';
import 'package:teaching/features/near_school_details/data/models/near_school_details_model.dart';
import 'package:teaching/features/notification/data/models/notification_response_model.dart';

abstract class AdsDetailsDataSource {
  Future<ResponseModel> getAdvertisementsDetails({required int id});
}

class AdsDetailsWithServer extends AdsDetailsDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> getAdvertisementsDetails({required int id}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getAdvertisementsDetails, queryParams: {"adsId": id}),
          fromJsonFunction: AdsDetailsResponseModel.fromJson);

  AdsDetailsWithServer(this.dioConsumer);
}
