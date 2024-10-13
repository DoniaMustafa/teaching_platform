
import 'dart:convert';

import 'package:teaching/core/export/export.dart';

class CoursesResponseModel extends ResponseModel{

  CoursesResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory CoursesResponseModel.fromJson(Map<String, dynamic> json) => CoursesResponseModel(
      success: json["Success"],
      code: json["Code"],
      message: json["Message"],

    data: json["Data"] == null ? [] : List<CoursesModel>.from(json["Data"]!.map((x) => CoursesModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "Code": code,
    "Data": data?.toJson(),
  };
}




