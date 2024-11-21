import 'package:teaching/core/export/export.dart';

class CourseDetailsResponseModel extends ResponseModel {
  CourseDetailsResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory CourseDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailsResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? []
            : List<TeacherModel>.from(
                json["Data"]!.map((x) => TeacherModel.fromJson(x))),
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

class TeacherModel {
  final int? teacherId;
  final int? groupId;
  final int? studentId;
  final String? teacherName;
  final String? teacherPicture;
  final String? gradeName;
  final int? subjectId;
  final String? subjectName;
  final List<TeacherCourse>? teacherCourses;
  final int? infoType;
  final String? profileImage;
  TeacherModel({
    this.infoType, this.profileImage,
    this.teacherName,
    this.teacherPicture,
    this.gradeName,
    this.groupId,
    this.teacherId,
    this.studentId,
    this.subjectId,
    this.subjectName,
    this.teacherCourses,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
        teacherName: json["TeacherName"],
        teacherPicture: json["TeacherPicture"],
        gradeName: json["GradeName"],
        subjectId: json["SubjectId"],  profileImage: json["ProfileImage"],
        subjectName: json["SubjectName"],
        teacherCourses: json["TeacherCourses"] == null
            ? []
            : List<TeacherCourse>.from(
                json["TeacherCourses"].map((x) => TeacherCourse.fromJson(x))),
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teacherId.isNotNull) {
      data['teacherId'] = teacherId;
    }
    if (teacherName.isNotNull) {
      data['teacherName'] = teacherName;
    }
    if (subjectId.isNotNull) {
      data['subjectId'] = subjectId;
    }
    if (studentId.isNotNull) {
      data['studentId'] = studentId;
    }
    if (infoType.isNotNull) {
      data['infoType'] = infoType;
    }
    if (groupId.isNotNull) {
      data['groupId'] = groupId;
    }

    return data;
  }
}

class TeacherCourse {
  final int? courseId;
  final int? courseLessonId;

  final String? title;
  final String? titleEn;
  final int? duration;
  final double? price;
  final String? currency;
  final double? totalLessonsPrice;
  final int? lessonsCount;
  final bool? isSubscribed;

  final String? courseImage;
  final List<CourseLesson>? courseLessons;

  TeacherCourse({
    this.courseId,
    this.title,
    this.titleEn,
    this.duration,
    this.price, this.courseImage,
    this.courseLessonId,
    this.currency,
    this.totalLessonsPrice,
    this.lessonsCount,
    this.isSubscribed,
    this.courseLessons,
  });

  factory TeacherCourse.fromJson(Map<String, dynamic> json) => TeacherCourse(
        courseId: json["CourseId"],
        title: json["Title"] ?? '',
        titleEn: json["TitleEN"] ?? '',
        duration: json["Duration"],   courseImage: json["CourseImage"],
        price: json["Price"],
        currency: json["Currency"]!,
        totalLessonsPrice: json["TotalLessonsPrice"],
        lessonsCount: json["LessonsCount"],
        isSubscribed: json["IsSubscribed"],
        courseLessons: json["CourseLessons"] == null
            ? []
            : List<CourseLesson>.from(
                json["CourseLessons"]!.map((x) => CourseLesson.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (courseId.isNotNull) {
      data['courseId'] = courseId;
    }
    if (courseLessonId.isNotNull) {
      data['courseLessonId'] = courseLessonId;
    }

    return data;
  }
}

class CourseLesson {
  final int? lessonId;
  final String? lessonTitle;
  final String? lessonTitleEn;
  final int? videosCount;
  final double? price;
  final String? currency;
  bool? free;
  bool? isSubscribed;

  CourseLesson({
    this.lessonId,
    this.lessonTitle,
    this.lessonTitleEn,
    this.videosCount,
    this.price,
    this.currency,
    this.free,
    this.isSubscribed,
  });

  factory CourseLesson.fromJson(Map<String, dynamic> json) => CourseLesson(
        lessonId: json["LessonId"],
        lessonTitle: json["LessonTitle"]!,
        lessonTitleEn: json["LessonTitleEN"]!,
        videosCount: json["VideosCount"],
        price: json["Price"],
        currency: json["Currency"]!,
        free: json["Free"],
        isSubscribed: json["IsSubscribed"],
      );

  // Map<String, dynamic> toJson() => {
  //   "LessonId": lessonId,
  //   "LessonTitle": lessonTitleValues.reverse[lessonTitle],
  //   "LessonTitleEN": lessonTitleEnValues.reverse[lessonTitleEn],
  //   "VideosCount": videosCount,
  //   "Price": price,
  //   "Currency": currencyValues.reverse[currency],
  //   "Free": free,
  //   "IsSubscribed": isSubscribed,
  // };
}
