import 'package:teaching/core/export/export.dart';

class TransactionResponseModel extends ResponseModel {
  TransactionResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      TransactionResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? []
            : List<TransactionData>.from(
                json["Data"]!.map((x) => TransactionData.fromJson(x))),
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

class TransactionData {
  final int? id;
  final String? description;
  final dynamic descriptionEn;
  final double? amount;
  final dynamic walletNo;
  final dynamic toWalletNo;
  final dynamic referenceId;
  final int? transactionType;
  final bool? isDeleted;
  final String? transactionDate;
  final String? currencyName;
  final String? image;

  TransactionData({
    this.id,
    this.description,
    this.descriptionEn,
    this.amount,
    this.walletNo,
    this.toWalletNo,
    this.referenceId,
    this.transactionType,
    this.isDeleted,
    this.transactionDate,
    this.currencyName,
    this.image,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
        id: json["Id"],
        description: json["Description"],
        descriptionEn: json["DescriptionEN"],
        amount: json["Amount"],
        walletNo: json["WalletNo"],
        toWalletNo: json["ToWalletNo"],
        referenceId: json["ReferenceId"],
        transactionType: json["TransactionType"],
        isDeleted: json["IsDeleted"],
        transactionDate: json["TransactionDate"],
        currencyName: json["CurrencyName"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Description": description,
        "DescriptionEN": descriptionEn,
        "Amount": amount,
        "WalletNo": walletNo,
        "ToWalletNo": toWalletNo,
        "ReferenceId": referenceId,
        "TransactionType": transactionType,
        "IsDeleted": isDeleted,
        "TransactionDate": transactionDate,
        "CurrencyName": currencyName,
        "Image": image,
      };
}
