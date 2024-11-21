class GroupsModel {
  final int? groupId;
  final String? groupName;
  final String? groupNameEn;
  final int? teacherId;
  final String? teacherName;
  final String? teacherPicture;
  final int? subjectId;
  final String? subjectName;
  final double? price;
  final String? currencyName;
  final double? rate;
  final int? followersCount;
  final int? studentsCount;
  final int? sessionsCount;
  final String? title;
  final String? titleEN;

  GroupsModel({
    this.studentsCount,
    this.sessionsCount,
    this.title,
    this.titleEN,
    this.groupId,
    this.groupName,
    this.groupNameEn,
    this.rate,
    this.followersCount,
    this.teacherId,
    this.teacherName,
    this.teacherPicture,
    this.subjectId,
    this.subjectName,
    this.price,
    this.currencyName,
  });

  factory GroupsModel.fromJson(Map<String, dynamic> json) => GroupsModel(
      groupId: json["GroupId"],
      groupName: json["GroupName"] == null ? '' : json["GroupName"]!,
      groupNameEn: json["GroupNameEN"] == null ? '' : json["GroupNameEN"]!,
      teacherId: json["TeacherId"],
      rate: json["Rate"] ?? null,
      teacherName: json["TeacherName"],
      teacherPicture: json["TeacherPicture"]?? null,
      subjectId: json["SubjectId"],
      subjectName: json["SubjectName"],
      studentsCount: json["StudentsCount"],
      sessionsCount: json["SessionsCount"],
      title: json["Title"],
      titleEN: json["TitleEN"],
      price: json["Price"],
      currencyName: json["CurrencyName"] == null ? '' : json["CurrencyName"]!,
      );

  // Map<String, dynamic> toJson() => {
  //   "GroupId": groupId,
  //   "GroupName": groupName,
  //   "GroupNameEN": groupNameEnValues.reverse[groupNameEn],
  //   "TeacherId": teacherId,
  //   "TeacherName": teacherName,
  //   "TeacherPicture": teacherPictureValues.reverse[teacherPicture],
  //   "SubjectId": subjectId,
  //   "SubjectName": subjectNameValues.reverse[subjectName],
  //   "Price": price,
  //   "CurrencyName": currencyNameValues.reverse[currencyName],
  // };
}
