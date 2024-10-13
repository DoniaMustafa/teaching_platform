
import 'package:teaching/core/export/export.dart';

class GroupLessonDetailsResponseModel extends ResponseModel{


  GroupLessonDetailsResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory GroupLessonDetailsResponseModel.fromJson(Map<String, dynamic> json) => GroupLessonDetailsResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? null : GroupLessonDetailsDataModel.fromJson(json["Data"]),
  );

  // Map<String, dynamic> toJson() => {
  //   "Id": id,
  //   "Success": success,
  //   "Message": message,
  //   "Code": code,
  //   "Data": data?.toJson(),
  // };
}

class GroupLessonDetailsDataModel {
  final int? groupId;
  final String? teacherName;
  final String? gradeName;
  final String? subjectName;
  final double? price;
  final String? currencyName;
  final String? startDate;
  final int? sessionsCount;
  final String? days;
  final String? groupPeriod;
  final String? introVideoUrl;
  final String? description;
  final List<GroupSession>? groupSessions;

  GroupLessonDetailsDataModel({
    this.groupId,
    this.teacherName,
    this.gradeName,
    this.subjectName,
    this.price,
    this.currencyName,
    this.startDate,
    this.sessionsCount,
    this.days,
    this.groupPeriod,
    this.introVideoUrl,
    this.description,
    this.groupSessions,
  });

  factory GroupLessonDetailsDataModel.fromJson(Map<String, dynamic> json) => GroupLessonDetailsDataModel(
    groupId: json["GroupId"],
    teacherName: json["TeacherName"],
    gradeName: json["GradeName"],
    subjectName: json["SubjectName"],
    price: json["Price"],
    currencyName: json["CurrencyName"],
    startDate: json["StartDate"],
    sessionsCount: json["SessionsCount"],
    days: json["Days"],
    groupPeriod: json["GroupPeriod"],
    introVideoUrl: json["IntroVideoURL"],
    description: json["Description"],
    groupSessions: json["GroupSessions"] == null ? [] : List<GroupSession>.from(json["GroupSessions"]!.map((x) => GroupSession.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "GroupId": groupId,
    "TeacherName": teacherName,
    "GradeName": gradeName,
    "SubjectName": subjectName,
    "Price": price,
    "CurrencyName": currencyName,
    "StartDate": startDate,
    "SessionsCount": sessionsCount,
    "Days": days,
    "GroupPeriod": groupPeriod,
    "IntroVideoURL": introVideoUrl,
    "Description": description,
    "GroupSessions": groupSessions == null ? [] : List<dynamic>.from(groupSessions!.map((x) => x.toJson())),
  };
}

class GroupSession {
  final int? groupSessionId;
  final String? title;
  final String? titleEn;
  final DateTime? classAt;
  final String? fromTime;
  final String? toTime;
  final List<GroupVideo>? groupVideos;

  GroupSession({
    this.groupSessionId,
    this.title,
    this.titleEn,
    this.classAt,
    this.fromTime,
    this.toTime,
    this.groupVideos,
  });

  factory GroupSession.fromJson(Map<String, dynamic> json) => GroupSession(
    groupSessionId: json["GroupSessionId"],
    title: json["Title"],
    titleEn: json["TitleEN"],
    classAt: json["ClassAt"] == null ? null : DateTime.parse(json["ClassAt"]),
    fromTime: json["FromTime"],
    toTime: json["ToTime"],
    groupVideos: json["GroupVideos"] == null ? [] : List<GroupVideo>.from(json["GroupVideos"]!.map((x) => GroupVideo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "GroupSessionId": groupSessionId,
    "Title": title,
    "TitleEN": titleEn,
    "ClassAt": classAt?.toIso8601String(),
    "FromTime": fromTime,
    "ToTime": toTime,
    "GroupVideos": groupVideos == null ? [] : List<dynamic>.from(groupVideos!.map((x) => x.toJson())),
  };
}

class GroupVideo {
  final int? groupVideoId;
  final String? title;
  final TitleEn? titleEn;
  final String? videoUrl;
  final int? duration;

  GroupVideo({
    this.groupVideoId,
    this.title,
    this.titleEn,
    this.videoUrl,
    this.duration,
  });

  factory GroupVideo.fromJson(Map<String, dynamic> json) => GroupVideo(
    groupVideoId: json["GroupVideoId"],
    title: json["Title"],
    titleEn: titleEnValues.map[json["TitleEN"]]!,
    videoUrl: json["VideoUrl"],
    duration: json["Duration"],
  );

  Map<String, dynamic> toJson() => {
    "GroupVideoId": groupVideoId,
    "Title": title,
    "TitleEN": titleEnValues.reverse[titleEn],
    "VideoUrl": videoUrl,
    "Duration": duration,
  };
}

enum TitleEn {
  GROUP_SESSION
}

final titleEnValues = EnumValues({
  "Group Session": TitleEn.GROUP_SESSION
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
