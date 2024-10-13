import 'dart:io';
import 'package:teaching/core/export/export.dart';
import '../../../local_storage/app_prefs.dart';

class DioInterceptor extends Interceptor {
  List<Map<dynamic, dynamic>> failedRequests = [];
  bool isRefreshing = false;
  // RefreshTokenInterceptor();
  // ...

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
    // if (err.response?.statusCode == 401) {
    //   // If refresh token is not available, perform logout
    //   if ((getRefreshToken() ?? "").isEmpty) {
    //     // ... (Logout logic)
    //     return handler.reject(err);
    //   }if (!isRefreshing) {
    //     // Initiating token refresh
    //     isRefreshing = true;
    //     final refreshTokenResponse = await refreshToken(err, handler);
    //     if (refreshTokenResponse.isSuccess) {
    //       // ... (Update headers and retry logic)
    //       err.requestOptions.headers['Authorization'] ='Bearer ${getUserAccessToken()}';
    //     } else {
    //       err.error = Errors(
    //         code: "511",
    //         message: "Session Expired",
    //       );
    //       // If the refresh process fails, reject with the previous error
    //       return handler.next(err);
    //     }
    //   } else {
    //     // Adding errored request to the queue
    //     failedRequests.add({'err': err, 'handler': handler});
    //   }
    // } else {
    //   return handler.next(err);
    // }
    super.onError(err, handler);
  }
  // Future refreshToken(DioError err, ErrorInterceptorHandler handler) async {
  //   Dio retryDio = Dio(
  //     BaseOptions(
  //       baseUrl: EndPoints.baseURL,
  //     ),
  //   );
  //   // handle refresh token
  //   var response = await retryDio.post(
  //     AppConstants.getRefreshToken,
  //     data: {
  //       "accessToken": getUserAccessToken(),
  //       "refreshToken": getRefreshToken(),
  //     },
  //     options: Options(
  //       headers: {"Content-Type": 'application/json'},
  //     ),
  //   );
  //   var parsedResponse = response.data;
  //   if (response.statusCode == 401 || response.statusCode == 403) {
  //     // handle logout
  //     return ResponseModel(false, "511");
  //   }
  //   if (response.statusCode == 200) {
  //     RefreshToken refreshTokenResponse = RefreshToken.fromJson(parsedResponse);
  //     if (refreshTokenResponse.errorCode != 511) {
  //       //save new refresh token and acces token
  //       saveUserRefreshToken(refreshTokenResponse.data?.refreshToken ?? "");
  //       saveUserAccessToken(refreshTokenResponse.data?.accessToken ?? "");
  //
  //       failedRequests.add({'err': err, 'handler': handler});
  //       await retryRequests(parsedResponse['data']['accessToken']);
  //       return ResponseModel(true, "200");
  //     } else {
  //       isRefreshing = false;
  //       return ResponseModel(false, "511");
  //     }
  //   }
  // }
  //
}
