import 'package:teaching/core/export/export.dart';

class CourseLessonDetailsResponseModel extends ResponseModel {
  CourseLessonDetailsResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory CourseLessonDetailsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      CourseLessonDetailsResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? null
            : CourseLessonDataMode.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "Message": message,
        "Code": code,
        "Data": data?.toJson(),
      };
}

class CourseLessonDataMode {
  final int? lessonId;
  final String? lessonTitle;
  final String? lessonTitleEn;
  final int? subjectId;
  final dynamic subjectName;
  final String? firstLessonVideoUrl;
  final double? rate;
  final int? reviewsCount;
  final List<CourseVideoModel>? courseVideos;
  final List<FirstLessonVideoCommentModel>? firstLessonVideoComments;
  final List<AttachmentsModel>? attachments;

  CourseLessonDataMode({
    this.lessonId,
    this.lessonTitle,
    this.lessonTitleEn,
    this.subjectId,
    this.subjectName,
    this.firstLessonVideoUrl,
    this.rate,
    this.reviewsCount,
    this.courseVideos,
    this.firstLessonVideoComments,
    this.attachments,
  });

  factory CourseLessonDataMode.fromJson(Map<String, dynamic> json) =>
      CourseLessonDataMode(
        lessonId: json["LessonId"],
        lessonTitle: json["LessonTitle"],
        lessonTitleEn: json["LessonTitleEN"],
        subjectId: json["SubjectId"],
        subjectName: json["SubjectName"],
        firstLessonVideoUrl: json["FirstLessonVideoUrl"],
        rate: json["Rate"]?.toDouble(),
        reviewsCount: json["ReviewsCount"],
        courseVideos: json["CourseVideos"] == null
            ? []
            : List<CourseVideoModel>.from(
                json["CourseVideos"]!.map((x) => CourseVideoModel.fromJson(x))),
        firstLessonVideoComments: json["FirstLessonVideoComments"] == null
            ? []
            : List<FirstLessonVideoCommentModel>.from(
                json["FirstLessonVideoComments"]!
                    .map((x) => FirstLessonVideoCommentModel.fromJson(x))),
        attachments: json["FirstLessonVideoAttachments"] == null
            ? []
            : List<AttachmentsModel>.from(json["FirstLessonVideoAttachments"]!
                .map((x) => AttachmentsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LessonId": lessonId,
        "LessonTitle": lessonTitle,
        "LessonTitleEN": lessonTitleEn,
        "SubjectId": subjectId,
        "SubjectName": subjectName,
        "FirstLessonVideoUrl": firstLessonVideoUrl,
        "Rate": rate,
        "ReviewsCount": reviewsCount,
        "CourseVideos": courseVideos == null
            ? []
            : List<dynamic>.from(courseVideos!.map((x) => x.toJson())),
        "FirstLessonVideoComments": firstLessonVideoComments == null
            ? []
            : List<dynamic>.from(
                firstLessonVideoComments!.map((x) => x.toJson())),
        "FirstLessonVideoAttachments": attachments == null
            ? []
            : List<dynamic>.from(attachments!.map((x) => x)),
      };
}

class CourseVideoModel {
  final int? courseVideoId;
  final String? title;
  final String? titleEn;
  final String? videoUrl;
  final String? duration;

  CourseVideoModel({
    this.courseVideoId,
    this.title,
    this.titleEn,
    this.videoUrl,
    this.duration,
  });

  factory CourseVideoModel.fromJson(Map<String, dynamic> json) =>
      CourseVideoModel(
        courseVideoId: json["CourseVideoId"],
        title: json["Title"],
        titleEn: json["TitleEN"],
        videoUrl: json["VideoUrl"],
        duration: json["Duration"],
      );

  Map<String, dynamic> toJson() => {
        "CourseVideoId": courseVideoId,
        "Title": title,
        "TitleEN": titleEn,
        "VideoUrl": videoUrl,
        "Duration": duration,
      };
}

class FirstLessonVideoCommentModel {
  final int? id;
  final String? comment;
  final DateTime? createdAt;
  final String? userName;
  final String? userImage;

  FirstLessonVideoCommentModel({
    this.id,
    this.comment,
    this.createdAt,
    this.userName,
    this.userImage,
  });

  factory FirstLessonVideoCommentModel.fromJson(Map<String, dynamic> json) =>
      FirstLessonVideoCommentModel(
        id: json["Id"],
        comment: json["Comment"] == null ? '' : json["Comment"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
        userName: json["UserName"],
        userImage: json["UserImage"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Comment": comment,
        "CreatedAt": createdAt?.toIso8601String(),
        "UserName": userName,
        "UserImage": userImage,
      };
}
// To parse this JSON data, do
//
//     final attachmentsModel = attachmentsModelFromJson(jsonString);

class AttachmentsModel {
  final int? id;
  final String? title;
  final String? titleEn;
  final String? description;
  final String? attachmentUrl;
  final DateTime? createdAt;

  AttachmentsModel({
    this.id,
    this.title,
    this.titleEn,
    this.description,
    this.attachmentUrl,
    this.createdAt,
  });

  factory AttachmentsModel.fromJson(Map<String, dynamic> json) =>
      AttachmentsModel(
        id: json["Id"],
        title: json["Title"],
        titleEn: json["TitleEN"],
        description: json["Description"],
        attachmentUrl: json["AttachmentUrl"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Title": title,
        "TitleEN": titleEn,
        "Description": description,
        "AttachmentUrl": attachmentUrl,
        "CreatedAt": createdAt?.toIso8601String(),
      };
}
