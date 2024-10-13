// To parse this JSON data, do
//
//     final countryResponseModel = countryResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:teaching/core/export/export.dart';


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
    data: json["Data"] == null ? null : CoursesDataModel.fromJson(json["Data"]),
  );


}

class CoursesDataModel {
  final List<CoursesModel>? courses;
  final List<GroupsModel>? groups;

  CoursesDataModel({
    this.courses,
    this.groups,
  });

  factory CoursesDataModel.fromJson(Map<String, dynamic> json) => CoursesDataModel(
    courses: json["Courses"] == null ? [] : List<CoursesModel>.from(json["Courses"]!.map((x) => CoursesModel.fromJson(x))),
    groups: json["Groups"] == null ? [] : List<GroupsModel>.from(json["Groups"]!.map((x) => GroupsModel.fromJson(x))),
  );


}


