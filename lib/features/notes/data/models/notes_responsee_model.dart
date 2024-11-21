import 'package:teaching/core/export/export.dart';

class NotesResponseModel extends ResponseModel {
  NotesResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory NotesResponseModel.fromJson(Map<String, dynamic> json) =>
      NotesResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? null
            : List<TeacherDetailsData>.from(
                json["Data"]!.map((x) => TeacherDetailsData.fromJson(x))),
      );


}
