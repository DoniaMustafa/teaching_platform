import 'dart:io';
import 'package:teaching/core/export/export.dart';
import '../../../local_storage/app_prefs.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers[HttpHeaders.contentTypeHeader] = ContentType.json;
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers[HttpHeaders.acceptLanguageHeader] = AppPrefs.language;

    // if (options.baseUrl.contains("google").isFalse &&
    //     AppPrefs.token.isNotNull) {
      options.headers[HttpHeaders.authorizationHeader] =
          "Bearer weA6rNu0WbyzvrTtEJw635y46Qt-hbHrYnslU8mBTJ9UeryXEOMyzZ99RKpw_cH66OdbkvntNLsbbUbkVaPuJAUdACk0zL-_wHnxA8O0RAjIssCmZEVR3ZBQMv7tOKjeme7t4pZNJ9cSj8tB7x7QU9cUVz0cnBCt6EGYvRozyBwOSbEy9_uWe-EaxsSSAQLVT2m4Ho0VAZTTVBviMm8X_YTE6LVD3ftWgIkJI1-FNF0clK6tudwlrEdYb9PCiyrNOlQPa0llWJS5-jqC29P6Fz0jcMpTbWWWnugPIEPLvKhcA5O8z2uXVf9imhpotbm4U7GVzxhY2qA9-WXrtqVd0KRs83iTcDAGUrpkJndShINDTBT9d3ZRDi2SAw0hIhHlnqo4OAsvkB3btrk9KydBrL6SKRNWc8TPHVtu5ENUuM7KtonBdnF6X8St9elskrxuTY8I2cKTBE68d_agzGHgPOB-gqEpJN98-zdQGVKDrGTtTeuSXJNaVV5UZ9cuhW9S620XiBULHvU56oIRCRfEtG3zSjYtj7iK2Q_TQi0Dzi0CtK3I_Pmeeoa3SCuXMUHz5Y-IOIh9Z8hw6lkhFJfGow";
    // }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
