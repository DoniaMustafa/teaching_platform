
import 'package:teaching/core/export/export.dart';

class ScheduleResponseModel extends ResponseModel{

  ScheduleResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory ScheduleResponseModel.fromJson(Map<String, dynamic> json) => ScheduleResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? [] : List<ScheduleDataModel>.from(json["Data"]!.map((x) => ScheduleDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "Code": code,
    "Data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ScheduleDataModel {
  final String? groupTitle;
  final int? groupId;
  final int? teacherId;
  final String? teacherName;
  final int? subjectId;
  final String? subjectName;
  final dynamic gradeName;
  final List<Session>? sessions;

  ScheduleDataModel({
    this.groupTitle,
    this.groupId,
    this.teacherId,
    this.teacherName,
    this.subjectId,
    this.subjectName,
    this.gradeName,
    this.sessions,
  });

  factory ScheduleDataModel.fromJson(Map<String, dynamic> json) => ScheduleDataModel(
    groupTitle: json["GroupTitle"],
    groupId: json["GroupId"],
    teacherId: json["TeacherId"],
    teacherName: json["TeacherName"],
    subjectId: json["SubjectId"],
    subjectName: json["SubjectName"],
    gradeName: json["GradeName"],
    sessions: json["Sessions"] == null ? [] : List<Session>.from(json["Sessions"]!.map((x) => Session.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "GroupTitle": groupTitle,
    "GroupId": groupId,
    "TeacherId": teacherId,
    "TeacherName": teacherName,
    "SubjectId": subjectId,
    "SubjectName": subjectName,
    "GradeName": gradeName,
    "Sessions": sessions == null ? [] : List<dynamic>.from(sessions!.map((x) => x.toJson())),
  };
}

class Session {
  final int? sessionId;
  final String? sessionTitle;
  final int? groupId;
  final dynamic groupName;
  final dynamic subjectName;
  final int? teacherId;
  final dynamic teacherName;
  final String? classAt;
  final String? from;
  final String? to;

  Session({
    this.sessionId,
    this.sessionTitle,
    this.groupId,
    this.groupName,
    this.subjectName,
    this.teacherId,
    this.teacherName,
    this.classAt,
    this.from,
    this.to,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    sessionId: json["SessionId"],
    sessionTitle: json["SessionTitle"],
    groupId: json["GroupId"],
    groupName: json["GroupName"],
    subjectName: json["SubjectName"],
    teacherId: json["TeacherId"],
    teacherName: json["TeacherName"],
    classAt: json["ClassAt"],
    from: json["From"],
    to: json["To"],
  );

  Map<String, dynamic> toJson() => {
    "SessionId": sessionId,
    "SessionTitle": sessionTitle,
    "GroupId": groupId,
    "GroupName": groupName,
    "SubjectName": subjectName,
    "TeacherId": teacherId,
    "TeacherName": teacherName,
    "ClassAt": classAt,
    "From": from,
    "To": to,
  };
}
