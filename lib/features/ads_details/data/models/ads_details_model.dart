import '../../../../core/export/export.dart';

class AdsDetailsResponseModel extends ResponseModel {
  AdsDetailsResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory AdsDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      AdsDetailsResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null ? null : AdsDetailsModel.fromJson(json["Data"]),
      );
}

class AdsDetailsModel {
  final int? id;
  final String? name;
  final String? description;
  final dynamic pathUrl;
  final dynamic logo;

  AdsDetailsModel({
    this.id,
    this.name,
    this.description,
    this.pathUrl,
    this.logo,
  });

  factory AdsDetailsModel.fromJson(Map<String, dynamic> json) => AdsDetailsModel(
        id: json["Id"],
        name: json["Name"],
        description: json["Description"],
        pathUrl: json["PathUrl"],
        logo: json["Logo"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Description": description,
        "PathUrl": pathUrl,
        "Logo": logo,
      };
}
