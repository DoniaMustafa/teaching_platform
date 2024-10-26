
import 'package:teaching/core/export/export.dart';

class BalanceResponseModel extends ResponseModel{


  BalanceResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory BalanceResponseModel.fromJson(Map<String, dynamic> json) => BalanceResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? null : BalanceDataModel.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "Code": code,
    "Data": data?.toJson(),
  };
}

class BalanceDataModel {
  final double? totalBalance;
  final double? availableBalance;
  final double? holdBalance;

  BalanceDataModel({
    this.totalBalance,
    this.availableBalance,
    this.holdBalance,
  });

  factory BalanceDataModel.fromJson(Map<String, dynamic> json) => BalanceDataModel(
    totalBalance: json["TotalBalance"],
    availableBalance: json["AvailableBalance"],
    holdBalance: json["HoldBalance"],
  );

  Map<String, dynamic> toJson() => {
    "TotalBalance": totalBalance,
    "AvailableBalance": availableBalance,
    "HoldBalance": holdBalance,
  };
}
