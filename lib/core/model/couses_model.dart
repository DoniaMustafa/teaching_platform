class CoursesModel {
  final int? courseId;
  final String? courseTitle;
  final String? courseTitleEn;
  final int? teacherId;
  final String? teacherName;
  final String? teacherPicture;
  final int? subjectId;
  final String? subjectName;
  final double? price;
  final String? currencyName;

  CoursesModel({
    this.courseId,
    this.courseTitle,
    this.courseTitleEn,
    this.teacherId,
    this.teacherName,
    this.teacherPicture,
    this.subjectId,
    this.subjectName,
    this.price,
    this.currencyName,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) => CoursesModel(
        courseId: json["CourseId"],
        courseTitle:
            json["CourseTitle"] == null ? 'arabic' : json["CourseTitle"]!,
        courseTitleEn:
            json["CourseTitleEN"] == null ? 'arabic' : json["CourseTitleEN"]!,
        teacherId: json["TeacherId"],
        teacherName: json["TeacherName"],
        teacherPicture: json["TeacherPicture"],
        subjectId: json["SubjectId"],
        subjectName: json["SubjectName"],
        price: json["Price"],
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
