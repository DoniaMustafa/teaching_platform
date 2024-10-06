import 'package:teaching/features/auth/data/models/contry_response_model.dart';
import '../../../../core/export/export.dart';

abstract class CountryRemoteDatasource {
  Future<ResponseModel> getCountries();}

class CountryWithServer extends CountryRemoteDatasource {
  DioConsumer dioConsumer;
  CountryWithServer({required this.dioConsumer});

  @override
  Future<ResponseModel> getCountries() async=> remoteExecute(
  request: dioConsumer.getRequest(
  path: EndPoints.country,

  ),
  fromJsonFunction: PublicResponseModel.fromJson);


}
