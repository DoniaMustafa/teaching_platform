// To parse this JSON data, do
//
//     final countryResponseModel = countryResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:teaching/core/export/export.dart';

CountryResponseModel countryResponseModelFromJson(String str) => CountryResponseModel.fromJson(json.decode(str));

String countryResponseModelToJson(CountryResponseModel data) => json.encode(data.toJson());

class CountryResponseModel extends ResponseModel{


  CountryResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) => CountryResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? [] : List<CountryDataModel>.from(json["Data"]!.map((x) => CountryDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "Code": code,
    "Data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CountryDataModel {
  final int? id;
  final String? name;

  CountryDataModel({
    this.id,
    this.name,
  });

  factory CountryDataModel.fromJson(Map<String, dynamic> json) => CountryDataModel(
    id: json["Id"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
  };
}
