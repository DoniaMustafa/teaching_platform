import '../../../../core/export/export.dart';

class LoginUserResponseModel extends ResponseModel {
  LoginUserResponseModel({
    super.success,
    super.message,
    super.data,
  });

  LoginUserResponseModel.fromJson(dynamic json) {
    success = json['Success'];
    message = json['Message'];
    data = json['Data'] != null ? UserDataModel.fromJson(json['Data']) : null;
  }

  LoginUserResponseModel copyWith({
    bool? success,
    String? message,
    UserDataModel? data,
  }) =>
      LoginUserResponseModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = (data as UserDataModel).toJson();
    }
    return map;
  }
}

class UserDataModel {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final UserModel? user;
  final int? stepNo;

  UserDataModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.stepNo,
    this.user,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        stepNo: json["StepNo"],
        expiresIn: int.tryParse('${json["expires_in"]}'),
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
  final int? id;
  final String? userId;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? nationalId;
  final int? stateId;
  final String? stateName;
  final int? cityId;
  final String? cityName;
  final int? countryId;
  final String? countryName;
  final int? educationTypeId;
  final String? educationTypeName;
  final int? programTypeId;
  final String? programTypeName;
  final int? gradeId;
  final String? gradeName;
  final String? schoolName;
  final String? image;
  final double? wallet;
  final int? gender;
  final String? genderName;
  final String? password;

  final String? verifyCode;
  final String? userRoles;
  final int? stepsNo;
  UserModel({
    this.password,
    this.id,
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.nationalId,
    this.stateId,
    this.stateName,
    this.cityId,
    this.cityName,
    this.countryId,
    this.countryName,
    this.educationTypeId,
    this.educationTypeName,
    this.programTypeId,
    this.programTypeName,
    this.gradeId,
    this.gradeName,
    this.schoolName,
    this.image,
    this.wallet,
    this.gender,
    this.genderName,
    this.userRoles,
    this.verifyCode,
    this.stepsNo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["Id"],
        userId: json["UserId"],
        name: json["Name"],
        email: json["Email"],
        phoneNumber: json["PhoneNumber"],
        nationalId: json["NationalId"],
        stateId: json["StateId"],
        stateName: json["StateName"],
        cityId: json["CityId"],
        cityName: json["CityName"],
        countryId: json["CountryId"],
        countryName: json["CountryName"],
        educationTypeId: json["EducationTypeId"],
        educationTypeName: json["EducationTypeName"],
        programTypeId: json["ProgramTypeId"],
        programTypeName: json["ProgramTypeName"],
        gradeId: json["GradeId"],
        gradeName: json["GradeName"],
        schoolName: json["SchoolName"],
        image: json["Image"],
        wallet: json["Wallet"],
        gender: json["Gender"],
        genderName: json["GenderName"],
        verifyCode: json["VerifyCode"],
        stepsNo: json["stepsNo"],
        userRoles: json["userRole"],
      );

  Map<String, dynamic> toJson() => {
        "PhoneNumber": phoneNumber,
        // "StepNo": stepsNo,
        "Email": email,
        "Name": name,
        "Gender": gender,
        "Code": verifyCode,
        "CountryId": countryId,
        "Password": password,
      };

  Map<String, dynamic> userToJson() => {
        "Id": id,
        "UserId": userId,
        "Name": name,
        "Email": email,
        "PhoneNumber": phoneNumber,
        "NationalId": nationalId,
        "StateId": stateId,
        "StateName": stateName,
        "CityId": cityId,
        "CityName": cityName,
        "CountryId": countryId,
        "CountryName": countryName,
        "EducationTypeId": educationTypeId,
        "EducationTypeName": educationTypeName,
        "ProgramTypeId": programTypeId,
        "ProgramTypeName": programTypeName,
        "GradeId": gradeId,
        "GradeName": gradeName,
        "SchoolName": schoolName,
        "Image": image,
        "Wallet": wallet,
        "Gender": gender,
        "GenderName": genderName,
        // "userRole": userRoles,
        "StepNo": stepsNo,
      };
  //
}

class UserResponseModel extends ResponseModel {
  UserResponseModel({
    super.success,
    super.message,
    super.data,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        success: json["Success"],
        message: json["Message"],
        data: json["Data"] == null ? null : UserModel.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": success,
        "message": message,
        "data": data!.toJson(),
      };
}
