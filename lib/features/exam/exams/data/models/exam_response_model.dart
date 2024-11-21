import 'package:teaching/core/export/export.dart';

class ExamResponseModel extends ResponseModel {
  ExamResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory ExamResponseModel.fromJson(Map<String, dynamic> json) =>
      ExamResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data:
            json["Data"] == null ? null : ExamDataModel.fromJson(json["Data"]),
      );
}

class ExamDataModel {
  final List<PassedExam>? passedExams;
  final List<NotPassedExam>? notPassedExam;

  ExamDataModel({
    this.passedExams,
    this.notPassedExam,
  });

  factory ExamDataModel.fromJson(Map<String, dynamic> json) => ExamDataModel(
        passedExams: json["PassedExams"] == null
            ? []
            : List<PassedExam>.from(
                json["PassedExams"]!.map((x) => PassedExam.fromJson(x))),
        notPassedExam: json["NotPassedExam"] == null
            ? []
            : List<NotPassedExam>.from(
                json["NotPassedExam"]!.map((x) => NotPassedExam.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PassedExams": passedExams == null
            ? []
            : List<dynamic>.from(passedExams!.map((x) => x.toJson())),
        "NotPassedExam": notPassedExam == null
            ? []
            : List<dynamic>.from(notPassedExam!.map((x) => x.toJson())),
      };
}

class NotPassedExam {
  final int? examId;
  final String? title;
  final dynamic stubjectName;
  final String? endDate;
  final bool? timeIsUp;
  final dynamic examDuration;

  NotPassedExam({
    this.examId,
    this.title,
    this.stubjectName,
    this.endDate,
    this.timeIsUp,
    this.examDuration,
  });

  factory NotPassedExam.fromJson(Map<String, dynamic> json) => NotPassedExam(
        examId: json["ExamId"],
        title: json["Title"],
        stubjectName: json["StubjectName"],
        endDate: json["EndDate"]!,
        timeIsUp: json["TimeIsUp"],
        examDuration: json["ExamDuration"],
      );

  Map<String, dynamic> toJson() => {
        "ExamId": examId,
        "Title": title,
        "StubjectName": stubjectName,
        "EndDate": endDate,
        "TimeIsUp": timeIsUp,
        "ExamDuration": examDuration,
      };
}

class PassedExam {
  final int? examId;
  final String? title;
  final String? stubjectName;
  final String? endDate;
  final double? degree;
  final double? maxDegree;
  final bool? passed;
  final bool? corrected;
  final dynamic examDuration;

  PassedExam({
    this.examId,
    this.title,
    this.stubjectName,
    this.endDate,
    this.degree,
    this.maxDegree,
    this.passed,
    this.corrected,
    this.examDuration,
  });

  factory PassedExam.fromJson(Map<String, dynamic> json) => PassedExam(
        examId: json["ExamId"],
        title: json["Title"],
        stubjectName: json["StubjectName"],
        endDate: json["EndDate"]!,
        degree: json["Degree"],
        maxDegree: json["MaxDegree"],
        passed: json["Passed"],
        corrected: json["Corrected"],
        examDuration: json["ExamDuration"],
      );

  Map<String, dynamic> toJson() => {
        "ExamId": examId,
        "Title": title,
        "StubjectName": stubjectName,
        "EndDate": endDate,
        "Degree": degree,
        "MaxDegree": maxDegree,
        "Passed": passed,
        "Corrected": corrected,
        "ExamDuration": examDuration,
      };
}
