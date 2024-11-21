import 'package:teaching/core/model/response_model.dart';

class VimeoVideoResponseModel extends ResponseModel {
  VimeoVideoResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory VimeoVideoResponseModel.fromJson(Map<String, dynamic> json) =>
      VimeoVideoResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data:
            json["Data"] == null ? null : VimeoVideoData.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "Message": message,
        "Code": code,
        "Data": data?.toJson(),
      };
}

class VimeoVideoData {
  final String? urlLink;

  VimeoVideoData({
    this.urlLink,
  });

  factory VimeoVideoData.fromJson(Map<String, dynamic> json) => VimeoVideoData(
        urlLink: json["UrlLink"],
      );
}
