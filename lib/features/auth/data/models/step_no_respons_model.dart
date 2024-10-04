import 'package:teaching/core/export/export.dart';

class StepNoResponseModel extends ResponseModel {


  StepNoResponseModel({

    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory StepNoResponseModel.fromJson(Map<String, dynamic> json) => StepNoResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? null : StepNoDataModel.fromJson(json["Data"]),
  );

}

class StepNoDataModel {
  final int? stepNo;

  StepNoDataModel({
    this.stepNo,
  });

  factory StepNoDataModel.fromJson(Map<String, dynamic> json) => StepNoDataModel(
    stepNo: json["StepNo"],
  );

  Map<String, dynamic> toJson() => {
    "StepNo": stepNo,
  };
}
