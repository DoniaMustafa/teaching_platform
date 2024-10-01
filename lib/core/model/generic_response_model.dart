

import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/model/generic_response_model.dart';

class GenericResponseModel  extends ResponseModel{


  GenericResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory GenericResponseModel.fromJson(Map<String, dynamic> json) => GenericResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? [] : List<GenericDataModel>.from(json["Data"]!.map((x) => GenericDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "Code": code,
    "Data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class GenericDataModel {
  final int? id;
  final String? name;
  final String? image;

  GenericDataModel({
    this.id,
    this.name,
    this.image,
  });

  factory GenericDataModel.fromJson(Map<String, dynamic> json) => GenericDataModel(
    id: json["Id"],
    name: json["Name"],
    image: json["Image"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Image": image,
  };
}