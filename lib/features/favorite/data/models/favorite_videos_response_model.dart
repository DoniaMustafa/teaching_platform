import 'package:teaching/core/export/export.dart';

class FavoriteVideoCoursesGroupsResponseModel extends ResponseModel {
  FavoriteVideoCoursesGroupsResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory FavoriteVideoCoursesGroupsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      FavoriteVideoCoursesGroupsResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? []
            : List<FavoriteVideoData>.from(
                json["Data"]!.map((x) => FavoriteVideoData.fromJson(x))),
      );
}

class FavoriteVideoData {
  final int? videoId;
  final String? title;
  final String? description;
  final String? courseName;
  final String? lessonName;
  final String? groupName;
  final String? sessionName;
  final String? videoUrl;
  final double? rateAverage;
  final int? userReviewCount;

  FavoriteVideoData({
    this.videoId,
    this.title,
    this.description,
    this.groupName,
    this.courseName,
    this.sessionName,
    this.lessonName,
    this.videoUrl,
    this.rateAverage,
    this.userReviewCount,
  });

  factory FavoriteVideoData.fromJson(Map<String, dynamic> json) =>
      FavoriteVideoData(
        videoId: json["VideoId"],
        title: json["Title"],
        description: json["Description"],
        courseName: json["CourseName"],
        groupName: json["GroupName"],
        sessionName: json["SessionName"],
        lessonName: json["LessonName"],
        videoUrl: json["VideoUrl"],
        rateAverage: json["RateAverage"]?.toDouble(),
        userReviewCount: json["UserReviewCount"],
      );

  Map<String, dynamic> toJson() => {
        "VideoId": videoId,
        "Title": title,
        "Description": description,
        "CourseName": courseName,
        "LessonName": lessonName,
        "VideoUrl": videoUrl,
        "RateAverage": rateAverage,
        "UserReviewCount": userReviewCount,
      };
}