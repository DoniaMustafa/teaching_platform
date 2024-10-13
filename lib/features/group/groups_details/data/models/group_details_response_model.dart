
import 'package:teaching/core/export/export.dart';

class GroupDetailsResponseModel extends ResponseModel{

  GroupDetailsResponseModel({
    // S.id,
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory GroupDetailsResponseModel.fromJson(Map<String, dynamic> json) => GroupDetailsResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? [] : List<GroupDetailsDataModel>.from(json["Data"]!.map((x) => GroupDetailsDataModel.fromJson(x))),
  );

  // Map<String, dynamic> toJson() => {
  //   "Id": id,
  //   "Success": success,
  //   "Message": message,
  //   "Code": code,
  //   "Data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  // };
}

class GroupDetailsDataModel {
  final String? teacherName;
  final String? teacherPicture;
  final String? gradeName;
  final int? subjectId;
  final String? subjectName;
  final List<TeacherGroup>? teacherGroups;

  GroupDetailsDataModel({
    this.teacherName,
    this.teacherPicture,
    this.gradeName,
    this.subjectId,
    this.subjectName,
    this.teacherGroups,
  });

  factory GroupDetailsDataModel.fromJson(Map<String, dynamic> json) => GroupDetailsDataModel(
    teacherName: json["TeacherName"]!,
    teacherPicture: json["TeacherPicture"]!,
    gradeName: json["GradeName"]!,
    subjectId: json["SubjectId"],
    subjectName: json["SubjectName"]!,
    teacherGroups: json["TeacherGroups"] == null ? [] : List<TeacherGroup>.from(json["TeacherGroups"]!.map((x) => TeacherGroup.fromJson(x))),
  );

  // Map<String, dynamic> toJson() => {
  //   "TeacherName": teacherName,
  //   "TeacherPicture": teacherPictureValues.reverse[teacherPicture],
  //   "GradeName": gradeNameValues.reverse[gradeName],
  //   "SubjectId": subjectId,
  //   "SubjectName": subjectNameValues.reverse[subjectName],
  //   "TeacherGroups": teacherGroups == null ? [] : List<dynamic>.from(teacherGroups!.map((x) => x.toJson())),
  // };
}

class TeacherGroup {
  final int? groupId;
  final String? title;
  final String? titleEn;
  final int? availablePlaces;
  final int? limit;
  final int? sessionsCount;
  final double? price;
  final String? currencyName;
  final bool? isSubscribed;

  TeacherGroup({
    this.groupId,
    this.title,
    this.titleEn,
    this.availablePlaces,
    this.limit,
    this.sessionsCount,
    this.price,
    this.currencyName,
    this.isSubscribed,
  });

  factory TeacherGroup.fromJson(Map<String, dynamic> json) => TeacherGroup(
    groupId: json["GroupId"],
    title: json["Title"]!,
    titleEn:json["TitleEN"]!,
    availablePlaces: json["AvailablePlaces"],
    limit: json["Limit"],
    sessionsCount: json["SessionsCount"],
    price: json["Price"],
    currencyName:json["CurrencyName"]!,
    isSubscribed: json["IsSubscribed"],
  );

  // Map<String, dynamic> toJson() => {
  //   "GroupId": groupId,
  //   "Title": titleValues.reverse[title],
  //   "TitleEN": titleEnValues.reverse[titleEn],
  //   "AvailablePlaces": availablePlaces,
  //   "Limit": limit,
  //   "SessionsCount": sessionsCount,
  //   "Price": price,
  //   "CurrencyName": currencyNameValues.reverse[currencyName],
  //   "IsSubscribed": isSubscribed,
  // };
}

