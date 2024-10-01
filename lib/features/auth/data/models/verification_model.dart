// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

import '../../../../core/export/export.dart';


class VerificationResponseModel extends ResponseModel {

  VerificationResponseModel({

    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory VerificationResponseModel.fromJson(Map<String, dynamic> json) => VerificationResponseModel(

    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? null : VerificationDataModel.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {

    "Success": success,
    "Message": message,
    "Code": code,
    "Data": data?.toJson(),
  };
}

class VerificationDataModel {
  final String? verificationCode;

  VerificationDataModel({
    this.verificationCode,
  });

  factory VerificationDataModel.fromJson(Map<String, dynamic> json) => VerificationDataModel(
    verificationCode: json["VerificationCode"],
  );

  Map<String, dynamic> toJson() => {
    "VerificationCode": verificationCode,
  };
}
