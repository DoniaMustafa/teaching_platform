// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

class BaseResponse {
  int? code;
  bool? success;
  String? message;
  BaseResponse({this.code, this.success, this.message});
}

class ResponseModel extends BaseResponse {
  dynamic data;

  ResponseModel({
    super.code,
    super.success,
    super.message,
    this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        success: json["Success"],
        code: json["Code"],
        message: json["Message"],
        data: json["Data"],
      );
}

class ResponseListModel extends BaseResponse {
  List<dynamic>? data;

  ResponseListModel({
    super.code,
    super.success,
    super.message,
    this.data,
  });

  factory ResponseListModel.fromJson(Map<String, dynamic> json) =>
      ResponseListModel(
        success: json["Success"],
        code: json["Code"],
        message: json["Message"],
        data: json["Data"],
      );
}
