// To parse this JSON data, do
//
//     final countryResponseModel = countryResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:teaching/core/export/export.dart';

PublicResponseModel countryResponseModelFromJson(String str) => PublicResponseModel.fromJson(json.decode(str));

String countryResponseModelToJson(PublicResponseModel data) => json.encode(data.toJson());

class PublicResponseModel extends ResponseModel{


  PublicResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory PublicResponseModel.fromJson(Map<String, dynamic> json) => PublicResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? [] : List<PublicDataModel>.from(json["Data"]!.map((x) => PublicDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "Code": code,
    "Data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PublicDataModel {
  final int? id;
  final String? name;

  PublicDataModel({
    this.id,
    this.name,
  });

  factory PublicDataModel.fromJson(Map<String, dynamic> json) => PublicDataModel(
    id: json["Id"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
  };
}
