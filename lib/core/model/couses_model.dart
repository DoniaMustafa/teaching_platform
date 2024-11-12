class CoursesModel {
  final int? courseId;
  final String? courseTitle;
  final String? courseTitleEn;
  final int? teacherId;
  final String? teacherName;
  final String? gradeName;
  final String? teacherPicture;
  final int? subjectId;
  final String? subjectName;
  final double? price;
  final String? currencyName;
  final double? rate;
  final int? followersCount;
  CoursesModel({
    this.courseId,
    this.courseTitle,
    this.gradeName,
    this.courseTitleEn,
    this.teacherId,
    this.teacherName,
    this.teacherPicture,
    this.subjectId,
    this.subjectName,
    this.followersCount,
    this.price,
    this.rate,
    this.currencyName,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) => CoursesModel(
        courseId: json["CourseId"],
        courseTitle:
            json["CourseTitle"] == null ? 'arabic' : json["CourseTitle"]!,
        courseTitleEn:
            json["CourseTitleEN"] == null ? 'arabic' : json["CourseTitleEN"]!,
        teacherId: json["TeacherId"], gradeName: json["Grades"],

        teacherName: json["TeacherName"],
        teacherPicture: json["TeacherPicture"],
        subjectId: json["SubjectId"],
        subjectName: json["SubjectName"],
        price: json["Price"],
        rate: json["Rate"]?.toDouble() ?? 0.0,
        followersCount: json["FollowersCount"] ?? 0,
        currencyName: json["CurrencyName"] == null ? '' : json["CurrencyName"]!,
      );

//   Map<String, dynamic> toJson() => {
//     "CourseId": courseId,
//     "CourseTitle": courseTitle,
//     "CourseTitleEN": courseTitleEnValues.reverse[courseTitleEn],
//     "TeacherId": teacherId,
//     "TeacherName": teacherName,
//     "TeacherPicture": teacherPictureValues.reverse[teacherPicture],
//     "SubjectId": subjectId,
//     "SubjectName": subjectNameValues.reverse[subjectName],
//     "Price": price,
//     "CurrencyName": currencyNameValues.reverse[currencyName],
//   };
}
