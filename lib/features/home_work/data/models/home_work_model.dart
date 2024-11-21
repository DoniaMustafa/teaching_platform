import 'package:teaching/core/export/export.dart';

class HomeworksModel extends ResponseModel {
  // final int? id;
  // final bool? success;
  // final String? message;
  // final int? code;
  // final Data? data;

  HomeworksModel({
    // this.id,
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory HomeworksModel.fromJson(Map<String, dynamic> json) => HomeworksModel(
        // id: json["Id"],
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null ? null : HomeworkDataModel.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        // "Id": id,
        "Success": success,
        "Message": message,
        "Code": code,
        "Data": data?.toJson(),
      };
}

class HomeworkDataModel {
  final List<HomeworkData>? deliveredHomeworks;
  final List<HomeworkData>? notDeliveredHomeworks;

  HomeworkDataModel({
    this.deliveredHomeworks,
    this.notDeliveredHomeworks,
  });

  factory HomeworkDataModel.fromJson(Map<String, dynamic> json) => HomeworkDataModel(
        deliveredHomeworks: json["DeliveredHomeworks"] == null
            ? []
            : List<HomeworkData>.from(json["DeliveredHomeworks"]!
                .map((x) => HomeworkData.fromJson(x))),
        notDeliveredHomeworks: json["NotDeliveredHomeworks"] == null
            ? []
            : List<HomeworkData>.from(json["NotDeliveredHomeworks"]!
                .map((x) => HomeworkData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DeliveredHomeworks": deliveredHomeworks == null
            ? []
            : List<dynamic>.from(deliveredHomeworks!.map((x) => x)),
        "NotDeliveredHomeworks": notDeliveredHomeworks == null
            ? []
            : List<dynamic>.from(notDeliveredHomeworks!.map((x) => x.toJson())),
      };
}

class HomeworkData {
  final int? homeworkId;
  final int? teacherId;
  final String? title;
  final String? endDate;
  final bool? timeIsUp;

  HomeworkData({
    this.homeworkId,
    this.teacherId,
    this.title,
    this.endDate,
    this.timeIsUp,
  });

  factory HomeworkData.fromJson(Map<String, dynamic> json) => HomeworkData(
        homeworkId: json["HomeworkId"],
        teacherId: json["TeacherId"],
        title: json["Title"],
        endDate: json["EndDate"],
        timeIsUp: json["TimeIsUp"],
      );

  Map<String, dynamic> toJson() => {
        "HomeworkId": homeworkId,
        "TeacherId": teacherId,
        "Title": title,
        "EndDate": endDate,
        "TimeIsUp": timeIsUp,
      };
}
