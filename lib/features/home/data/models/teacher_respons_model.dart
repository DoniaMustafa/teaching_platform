// To parse this JSON data, do
//
//     final teacherResponseModel = teacherResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:teaching/core/export/export.dart';

TeacherResponseModel teacherResponseModelFromJson(String str) =>
    TeacherResponseModel.fromJson(json.decode(str));

String teacherResponseModelToJson(TeacherResponseModel data) =>
    json.encode(data.toJson());

class TeacherResponseModel extends ResponseModel{


  TeacherResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory TeacherResponseModel.fromJson(Map<String, dynamic> json) =>
      TeacherResponseModel(

        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? []
            : List<TeacherDataModel>.from(
                json["Data"]!.map((x) => TeacherDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "Message": message,
        "Code": code,
        "Data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TeacherDataModel {
  final int? id;
  final String? name;
  final String? profileImage;
  final String? subjects;
  final double? rate;
  final int? followersCount;

  TeacherDataModel({
    this.id,
    this.name,
    this.profileImage,
    this.subjects,
    this.rate,
    this.followersCount,
  });

  factory TeacherDataModel.fromJson(Map<String, dynamic> json) =>
      TeacherDataModel(
        id: json["Id"],
        name: json["Name"],
        profileImage: json["ProfileImage"]!,
        subjects: json["Subjects"],
        rate: json["Rate"]?.toDouble(),
        followersCount: json["FollowersCount"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "ProfileImage": profileImage,
        "Subjects": subjects,
        "Rate": rate,
        "FollowersCount": followersCount,
      };
}
