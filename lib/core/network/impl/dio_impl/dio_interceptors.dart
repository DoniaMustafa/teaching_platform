import 'dart:convert';
import 'dart:io';
import 'package:teaching/core/export/export.dart';
import 'package:flutter/foundation.dart';
import 'package:teaching/features/auth/data/data_sources/user_local_datasource.dart';

class DioInterceptor extends Interceptor {
  // List<Map<dynamic, dynamic>> failedRequests = [];
  // bool isRefreshing = false;
  // RefreshTokenInterceptor();
  // ...
  UserLocalDataSource? local;  DioConsumer? dioConsumer;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers[HttpHeaders.contentTypeHeader] = ContentType.json;
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers[HttpHeaders.acceptLanguageHeader] = AppPrefs.language;

    if (options.baseUrl.contains("google").isFalse &&
        AppPrefs.token.isNotNull) {
      options.headers[HttpHeaders.authorizationHeader] =
          "Bearer ${AppPrefs.token}";
    }
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
    if (err.response?.statusCode == 401) {
      // UserModel? authenticatedUser =
      //     await authLocalDataSource.getSavedLoginCredentials();
      // if (authenticatedUser != null) {
      // if (await _refreshToken(
      //   authenticatedUser,
      // )) {
      //   return handler.resolve(await _retry(err.requestOptions));
      // }
      // }
    }
    super.onError(err, handler);
  }


// Future<bool> _refreshToken(String token) async {
//   final response = await dioConsumer!.putRequest(path:EndPoints.refreshToken, body: {"deviceToken":token});
//
// final jsonResponse = jsonDecode(response);
// LoginUserResponseModel baseResponse =LoginUserResponseModel.fromJson(jsonResponse);
// if (baseResponse.success!) {
//  token = baseResponse.data["token"];
// //   authenticatedUser.refreshToken = baseResponse.data["refreshToken"];
// //   authLocalDataSource.saveLoginCredentials(userModel: authenticatedUser);
// //   return true;
// // } else {
// //   return false;
// // }
// }
}
