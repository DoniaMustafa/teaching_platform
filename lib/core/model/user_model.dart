import 'dart:convert';

import 'package:teaching/core/export/export.dart';
UserResponseModel userModelFromJson(String str) => UserResponseModel.fromJson(json.decode(str));
String userModelToJson(UserResponseModel data) => json.encode(data.toJson());

class UserResponseModel extends ResponseModel{
  UserResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => UserResponseModel(
    success: json["Success"],
    message: json["Message"],
    code: json["Code"],
    data: json["Data"] == null ? null : UserDataModel.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "Code": code,
    "Data": data?.toJson(),
  };
}

class UserDataModel {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final UserModel? user;

  UserDataModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.user,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "user": user?.toJson(),
  };
}

class UserModel {
  final String? phoneNumber;
  final String? userId;
  final int? stepsNo;
  final String? name;
  final String? profilePicture;
  final String? userRole;
  final String? wallet;
  final String? priviliges;

  UserModel({
    this.phoneNumber,
    this.userId,
    this.stepsNo,
    this.name,
    this.profilePicture,
    this.userRole,
    this.wallet,
    this.priviliges,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    phoneNumber: json["phoneNumber"],
    userId: json["userId"],
    stepsNo: json["stepsNo"],
    name: json["name"],
    profilePicture: json["profilePicture"],
    userRole: json["userRole"],
    wallet: json["wallet"],
    priviliges: json["priviliges"],
  );

  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
    "userId": userId,
    "stepsNo": stepsNo,
    "name": name,
    "profilePicture": profilePicture,
    "userRole": userRole,
    "wallet": wallet,
    "priviliges": priviliges,
  };
}
