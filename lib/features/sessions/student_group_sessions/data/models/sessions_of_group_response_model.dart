
import 'package:teaching/core/export/export.dart';

class SessionsOfGroupResponseModel extends ResponseModel {

  SessionsOfGroupResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory SessionsOfGroupResponseModel.fromJson(Map<String, dynamic> json) => SessionsOfGroupResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? [] : List<SessionsOfGroupData>.from(json["Data"]!.map((x) => SessionsOfGroupData.fromJson(x))),
  );

}

class SessionsOfGroupData {
  final int? id;
  final String? title;
  final String? groupName;
  final DateTime? classAt;
  final String? classAtFormat;
  final String? fromToTimeFormat;
  final String? fromTime;
  final String? toTime;
  final List<GroupVideo>? groupVideos;

  SessionsOfGroupData({
    this.id,
    this.title,
    this.groupName,
    this.classAt,
    this.classAtFormat,
    this.fromToTimeFormat,
    this.fromTime,
    this.toTime,
    this.groupVideos,
  });

  factory SessionsOfGroupData.fromJson(Map<String, dynamic> json) => SessionsOfGroupData(
    id: json["Id"],
    title: json["Title"],
    groupName: json["GroupName"],
    classAt: json["ClassAt"] == null ? null : DateTime.parse(json["ClassAt"]),
    classAtFormat: json["ClassAtFormat"],
    fromToTimeFormat: json["FromToTimeFormat"],
    fromTime: json["FromTime"],
    toTime: json["ToTime"],
    groupVideos: json["GroupVideos"] == null ? [] : List<GroupVideo>.from(json["GroupVideos"]!.map((x) => GroupVideo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Title": title,
    "GroupName": groupName,
    "ClassAt": classAt?.toIso8601String(),
    "ClassAtFormat": classAtFormat,
    "FromToTimeFormat": fromToTimeFormat,
    "FromTime": fromTime,
    "ToTime": toTime,
    "GroupVideos": groupVideos == null ? [] : List<dynamic>.from(groupVideos!.map((x) => x.toJson())),
  };
}

class GroupVideo {
  final int? id;
  final String? title;
  final dynamic titleEn;
  final dynamic description;
  final String? videoUrl;
  final int? duration;
  final dynamic attachments;
  final dynamic groupVideoAttachments;
  final dynamic groupVideoComments;

  GroupVideo({
    this.id,
    this.title,
    this.titleEn,
    this.description,
    this.videoUrl,
    this.duration,
    this.attachments,
    this.groupVideoAttachments,
    this.groupVideoComments,
  });

  factory GroupVideo.fromJson(Map<String, dynamic> json) => GroupVideo(
    id: json["Id"],
    title: json["Title"],
    titleEn: json["TitleEN"],
    description: json["Description"],
    videoUrl: json["VideoUrl"],
    duration: json["Duration"],
    attachments: json["Attachments"],
    groupVideoAttachments: json["GroupVideoAttachments"],
    groupVideoComments: json["GroupVideoComments"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Title": title,
    "TitleEN": titleEn,
    "Description": description,
    "VideoUrl": videoUrl,
    "Duration": duration,
    "Attachments": attachments,
    "GroupVideoAttachments": groupVideoAttachments,
    "GroupVideoComments": groupVideoComments,
  };
}
