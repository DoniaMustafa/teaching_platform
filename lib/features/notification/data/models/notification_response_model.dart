
import 'package:teaching/core/export/export.dart';

class NotificationResponseModel extends ResponseModel{



  NotificationResponseModel({

    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) => NotificationResponseModel(

    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? [] : List<NotificationDataModel>.from(json["Data"]!.map((x) => NotificationDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {

    "Success": success,
    "Message": message,
    "Code": code,
    "Data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class NotificationDataModel {
  final int? id;
  final String? text;
  final bool? isRead;
  final String? createdAt;
  final String? data;

  NotificationDataModel({
    this.id,
    this.text,
    this.isRead,
    this.createdAt,
    this.data,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) => NotificationDataModel(
    id: json["Id"],
    text: json["Text"],
    isRead: json["IsRead"],
    createdAt: json["CreatedAt"],
    data: json["Data"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Text": text,
    "IsRead": isRead,
    "CreatedAt": createdAt,
    "Data": data,
  };
}
