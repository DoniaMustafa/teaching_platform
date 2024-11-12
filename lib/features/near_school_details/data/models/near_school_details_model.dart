
import '../../../../core/export/export.dart';

class SchoolDetailsResponseModel extends ResponseModel{


  SchoolDetailsResponseModel({
   super.success,
   super.message,
   super.code,
   super.data,
  });

  factory SchoolDetailsResponseModel.fromJson(Map<String, dynamic> json) => SchoolDetailsResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? null : SchoolDetailsModel.fromJson(json["Data"]),
  );


}

class SchoolDetailsModel {
  final int? id;
  final String? name;
  final dynamic nameEn;
  final String? description;
  final dynamic descriptionEn;
  final dynamic identificationNo;
  final int? stateId;
  final dynamic state;
  final String? address;
  final double? longitude;
  final double? latitude;
  final dynamic logo;
  final int? rate;
  final int? studentCount;
  final dynamic createdById;
  final dynamic createdAt;
  final dynamic updatedById;
  final dynamic updatedAt;
  final bool? isDeleted;
  final dynamic deletedAt;
  final dynamic deletedById;
  final List<dynamic>? schoolImages;

  SchoolDetailsModel({
    this.id,
    this.name,
    this.nameEn,
    this.description,
    this.descriptionEn,
    this.identificationNo,
    this.stateId,
    this.state,
    this.address,
    this.longitude,
    this.latitude,
    this.logo,
    this.rate,
    this.studentCount,
    this.createdById,
    this.createdAt,
    this.updatedById,
    this.updatedAt,
    this.isDeleted,
    this.deletedAt,
    this.deletedById,
    this.schoolImages,
  });

  factory SchoolDetailsModel.fromJson(Map<String, dynamic> json) => SchoolDetailsModel(
    id: json["Id"],
    name: json["Name"],
    nameEn: json["NameEN"],
    description: json["Description"],
    descriptionEn: json["DescriptionEn"],
    identificationNo: json["IdentificationNo"],
    stateId: json["StateId"],
    state: json["State"],
    address: json["Address"],
    longitude: json["Longitude"]?.toDouble(),
    latitude: json["Latitude"]?.toDouble(),
    logo: json["Logo"],
    rate: json["Rate"],
    studentCount: json["StudentCount"],
    createdById: json["CreatedById"],
    createdAt: json["CreatedAt"],
    updatedById: json["UpdatedById"],
    updatedAt: json["UpdatedAt"],
    isDeleted: json["IsDeleted"],
    deletedAt: json["DeletedAt"],
    deletedById: json["DeletedById"],
    schoolImages: json["SchoolImages"] == null ? [] : List<dynamic>.from(json["SchoolImages"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "NameEN": nameEn,
    "Description": description,
    "DescriptionEn": descriptionEn,
    "IdentificationNo": identificationNo,
    "StateId": stateId,
    "State": state,
    "Address": address,
    "Longitude": longitude,
    "Latitude": latitude,
    "Logo": logo,
    "Rate": rate,
    "StudentCount": studentCount,
    "CreatedById": createdById,
    "CreatedAt": createdAt,
    "UpdatedById": updatedById,
    "UpdatedAt": updatedAt,
    "IsDeleted": isDeleted,
    "DeletedAt": deletedAt,
    "DeletedById": deletedById,
    "SchoolImages": schoolImages == null ? [] : List<dynamic>.from(schoolImages!.map((x) => x)),
  };
}
