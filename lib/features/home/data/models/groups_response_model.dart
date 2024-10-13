import 'package:teaching/core/export/export.dart';

class GroupsResponseModel extends ResponseModel {
  GroupsResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory GroupsResponseModel.fromJson(Map<String, dynamic> json) =>
      GroupsResponseModel(
        success: json["Success"],
        code: json["Code"],
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : List<GroupsModel>.from(
                json["Data"]!.map((x) => GroupsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "Message": message,
        "Code": code,
        "Data": data?.toJson(),
      };
}
