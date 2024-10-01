
import 'dart:convert';

import 'package:teaching/core/export/export.dart';

class CourserAndGroupsResponseModel extends ResponseModel{

  CourserAndGroupsResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory CourserAndGroupsResponseModel.fromJson(Map<String, dynamic> json) => CourserAndGroupsResponseModel(
      success: json["Success"],
      code: json["Code"],
      message: json["Message"],
      data: json["Data"] == null ? null : CoursesAndGroupsDataModel.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "Code": code,
    "Data": data?.toJson(),
  };
}

class CoursesAndGroupsDataModel {
  final List<CoursesModel>? courses;
  final List<GroupsModel>? groups;

  CoursesAndGroupsDataModel({
    this.courses,
    this.groups,
  });

  factory CoursesAndGroupsDataModel.fromJson(Map<String, dynamic> json) => CoursesAndGroupsDataModel(
    courses: json["Courses"] == null ? [] : List<CoursesModel>.from(json["Courses"]!.map((x) => CoursesModel.fromJson(x))),
    groups: json["Groups"] == null ? [] : List<GroupsModel>.from(json["Groups"]!.map((x) => GroupsModel.fromJson(x))),
  );

  // Map<String, dynamic> toJson() => {
  //   "Courses": courses == null ? [] : List<dynamic>.from(courses!.map((x) => x.toJson())),
  //   "Groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x.toJson())),
  // };
}


