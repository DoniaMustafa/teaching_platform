// To parse this JSON data, do
//
//     final studentRequestParentsResponseModel = studentRequestParentsResponseModelFromJson(jsonString);

import 'package:teaching/core/export/export.dart';

class StudentRequestParentsResponseModel extends ResponseModel {
  StudentRequestParentsResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory StudentRequestParentsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      StudentRequestParentsResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? []
            : List<RequestOfParentsData>.from(
                json["Data"]!.map((x) => RequestOfParentsData.fromJson(x))),
      );
}

class RequestOfParentsData {
  final int? parentRequestId;
  final int? parentId;
  final String? parentName;
  final String? parentImage;

  RequestOfParentsData({
    this.parentRequestId,
    this.parentId,
    this.parentName,
    this.parentImage,
  });

  factory RequestOfParentsData.fromJson(Map<String, dynamic> json) =>
      RequestOfParentsData(
        parentRequestId: json["ParentRequestId"],
        parentId: json["ParentId"],
        parentName: json["ParentName"],
        parentImage: json["ParentImage"],
      );

  Map<String, dynamic> toJson() => {
        "ParentRequestId": parentRequestId,
        "ParentId": parentId,
        "ParentName": parentName,
        "ParentImage": parentImage,
      };
}
