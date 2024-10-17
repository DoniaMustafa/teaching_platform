
import 'package:teaching/core/export/export.dart';

class TeacherDetailsResponseModel extends ResponseModel{


  TeacherDetailsResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory TeacherDetailsResponseModel.fromJson(Map<String, dynamic> json) => TeacherDetailsResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? null : TeacherDetailsData.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "Code": code,
    "Data": data?.toJson(),
  };
}

class TeacherDetailsData {
  final int? teacherId;
  final String? teacherName;
  final String? profileImage;
  final double? rate;
  final int? followersCount;
  final int? reviewersCount;
  final String? subjects;
  final String? grades;
  final String? educationTypes;
  final int? coursesCount;
  final int? groupsCount;
  final double? workingHours;
  final int? subscribersCount;
  final bool? isFollowed;
  final dynamic about;

  TeacherDetailsData({
    this.teacherId,
    this.teacherName,
    this.profileImage,
    this.rate,
    this.followersCount,
    this.reviewersCount,
    this.subjects,
    this.grades,
    this.educationTypes,
    this.coursesCount,
    this.groupsCount,
    this.workingHours,
    this.subscribersCount,
    this.isFollowed,
    this.about,
  });

  factory TeacherDetailsData.fromJson(Map<String, dynamic> json) => TeacherDetailsData(
    teacherId: json["TeacherId"],
    teacherName: json["TeacherName"],
    profileImage: json["ProfileImage"],
    rate: json["Rate"]?.toDouble(),
    followersCount: json["FollowersCount"],
    reviewersCount: json["ReviewersCount"],
    subjects: json["Subjects"],
    grades: json["Grades"],
    educationTypes: json["EducationTypes"],
    coursesCount: json["CoursesCount"],
    groupsCount: json["GroupsCount"],
    workingHours: json["WorkingHours"]?.toDouble(),
    subscribersCount: json["SubscribersCount"],
    isFollowed: json["IsFollowed"],
    about: json["About"],
  );

  Map<String, dynamic> toJson() => {
    "TeacherId": teacherId,
    "TeacherName": teacherName,
    "ProfileImage": profileImage,
    "Rate": rate,
    "FollowersCount": followersCount,
    "ReviewersCount": reviewersCount,
    "Subjects": subjects,
    "Grades": grades,
    "EducationTypes": educationTypes,
    "CoursesCount": coursesCount,
    "GroupsCount": groupsCount,
    "WorkingHours": workingHours,
    "SubscribersCount": subscribersCount,
    "IsFollowed": isFollowed,
    "About": about,
  };
}
