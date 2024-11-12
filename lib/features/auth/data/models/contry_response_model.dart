// To parse this JSON data, do
//
//     final countryResponseModel = countryResponseModelFromJson(jsonString);

import 'package:teaching/core/export/export.dart';

class PublicResponseModel extends ResponseModel {
  PublicResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory PublicResponseModel.fromJson(Map<String, dynamic> json) =>
      PublicResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? []
            : List<PublicDataModel>.from(
                json["Data"]!.map((x) => PublicDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "Message": message,
        "Code": code,
        "Data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PublicDataModel {
  final int? id;
  final String? name;
  final String? image;
  final String? profileImage;
  PublicDataModel({
    this.id,
    this.name,
    this.image,
    this.profileImage,
  });

  factory PublicDataModel.fromJson(Map<String, dynamic> json) =>
      PublicDataModel(
        id: json["Id"],
        profileImage: json["ProfileImage"],
        name: json["Name"],
        image: json['Image'],
      );

}
