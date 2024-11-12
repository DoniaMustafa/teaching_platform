import 'package:teaching/features/auth/data/models/contry_response_model.dart';
import '../../../../core/export/export.dart';

abstract class CountryRemoteDatasource {
  Future<ResponseModel> getCountries();
  Future<ResponseModel> getCities({required int countryId});
  Future<ResponseModel> getRegion({required int cityId});
}

class CountryWithServer extends CountryRemoteDatasource {
  DioConsumer dioConsumer;
  CountryWithServer({required this.dioConsumer});

  @override
  Future<ResponseModel> getCountries() async => remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.country,
      ),
      fromJsonFunction: PublicResponseModel.fromJson);

  @override
  Future<ResponseModel> getCities({required int countryId}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.city, queryParams: {"countryId": countryId}),
          fromJsonFunction: PublicResponseModel.fromJson);

  @override
  Future<ResponseModel> getRegion({required int cityId}) async => remoteExecute(
      request: dioConsumer
          .getRequest(path: EndPoints.region, queryParams: {"cityId": cityId}),
      fromJsonFunction: PublicResponseModel.fromJson);
}
