import 'package:teaching/core/export/export.dart';

class VideoSessionsResponseModel extends ResponseModel {
  VideoSessionsResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory VideoSessionsResponseModel.fromJson(Map<String, dynamic> json) =>
      VideoSessionsResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? null
            : VideoSessionsData.fromJson(json["Data"]),
      );
}

class VideoSessionsData {
  final String? title;
  final String? groupName;
  final dynamic description;
  final dynamic videoUrl;
  final int? duration;
  final String? classAt;
  final String? fromTime;
  final String? toTime;
  final List<SessionsGroupVideo>? groupVideos;

  VideoSessionsData({
    this.title,
    this.groupName,
    this.description,
    this.videoUrl,
    this.duration,
    this.classAt,
    this.fromTime,
    this.toTime,
    this.groupVideos,
  });

  factory VideoSessionsData.fromJson(Map<String, dynamic> json) =>
      VideoSessionsData(
        title: json["Title"],
        groupName: json["GroupName"],
        description: json["Description"],
        videoUrl: json["VideoUrl"],
        duration: json["Duration"],
        classAt: json["ClassAt"],
        fromTime: json["FromTime"],
        toTime: json["ToTime"],
        groupVideos: json["GroupVideos"] == null
            ? []
            : List<SessionsGroupVideo>.from(
                json["GroupVideos"]!.map((x) => SessionsGroupVideo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "GroupName": groupName,
        "Description": description,
        "VideoUrl": videoUrl,
        "Duration": duration,
        "ClassAt": classAt,
        "FromTime": fromTime,
        "ToTime": toTime,
        "GroupVideos": groupVideos == null
            ? []
            : List<dynamic>.from(groupVideos!.map((x) => x.toJson())),
      };
}

class SessionsGroupVideo {
  final int? id;
  final String? title;
  final dynamic titleEn;
  final String? description;
  final String? videoUrl;
  final int? duration;
  final dynamic attachments;
  final List<GroupVideoAttachment>? groupVideoAttachments;
  final List<GroupVideoComment>? groupVideoComments;
  final bool? isExternalLink;

  SessionsGroupVideo({
    this.id,
    this.title,
    this.titleEn,
    this.description,
    this.videoUrl,
    this.duration,
    this.attachments,
    this.groupVideoAttachments,
    this.groupVideoComments,
    this.isExternalLink,
  });

  factory SessionsGroupVideo.fromJson(Map<String, dynamic> json) => SessionsGroupVideo(
        id: json["Id"],
        title: json["Title"],
        titleEn: json["TitleEN"],
        description: json["Description"],
        videoUrl: json["VideoUrl"],
        duration: json["Duration"],
        attachments: json["Attachments"],
        groupVideoAttachments: json["GroupVideoAttachments"] == null
            ? []
            : List<GroupVideoAttachment>.from(json["GroupVideoAttachments"]!
                .map((x) => GroupVideoAttachment.fromJson(x))),
        groupVideoComments: json["GroupVideoComments"] == null
            ? []
            : List<GroupVideoComment>.from(json["GroupVideoComments"]!
                .map((x) => GroupVideoComment.fromJson(x))),
        isExternalLink: json["IsExternalLink"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Title": title,
        "TitleEN": titleEn,
        "Description": description,
        "VideoUrl": videoUrl,
        "Duration": duration,
        "Attachments": attachments,
        "GroupVideoAttachments": groupVideoAttachments == null
            ? []
            : List<dynamic>.from(groupVideoAttachments!.map((x) => x.toJson())),
        "GroupVideoComments": groupVideoComments == null
            ? []
            : List<dynamic>.from(groupVideoComments!.map((x) => x)),
        "IsExternalLink": isExternalLink,
      };
}

class GroupVideoAttachment {
  final String? title;
  final String? description;
  final String? attachmentUrl;

  GroupVideoAttachment({
    this.title,
    this.description,
    this.attachmentUrl,
  });

  factory GroupVideoAttachment.fromJson(Map<String, dynamic> json) =>
      GroupVideoAttachment(
        title: json["Title"],
        description: json["Description"],
        attachmentUrl: json["AttachmentUrl"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Description": description,
        "AttachmentUrl": attachmentUrl,
      };
}

class GroupVideoComment {
  final int? id;
  final String? comment;
  final DateTime? createdAt;
  final String? createdById;
  final String? userImage;
  final String? userName;

  GroupVideoComment({
    this.id,
    this.comment,
    this.createdAt,
    this.createdById,
    this.userImage,
    this.userName,
  });

  factory GroupVideoComment.fromJson(Map<String, dynamic> json) =>
      GroupVideoComment(
        id: json["Id"],
        comment: json["Comment"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),

        createdById: json["CreatedById"],
        userImage: json["UserImage"],
        userName: json["UserName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Comment": comment,
        "CreatedAt": createdAt,
        "CreatedById": createdById,
        "UserImage": userImage,
        "UserName": userName,
      };
}
