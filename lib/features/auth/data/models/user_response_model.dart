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
  final String? phoneNumber;
  final String? userId;
  final String? verifyCode;

  final int? stepsNo;
  final String? name;
  final String? image;
  final String? email;
  final String? countryId;
  final String? password;
  final String? profilePicture;
  final String? userRole;
  final String? wallet;
  final String? priviliges;
  final int? educationTypeId;
  final int? programTypeId;
  final int? gradeIds;
  UserModel({
    this.phoneNumber,
    this.userId,
    this.stepsNo,
    this.name,
    this.gradeIds,
    this.verifyCode,
    this.countryId,
    this.programTypeId,
    this.educationTypeId,
    this.profilePicture,
    this.userRole,
    this.image,
    this.email,
    this.password,
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
        "PhoneNumber": phoneNumber,
        // "StepNo": stepsNo,
        "Email": email,
        "Name": name,
        // "EducationTypeIds":  educationTypeId.isNotNull? [educationTypeId]: null,
        //     "ProgramTypeIds": programTypeId.isNotNull? [programTypeId]: null,
        //     "GradeIds": gradeIds.isNotNull? [gradeIds]: null,
        "Code": verifyCode,
        "CountryId": countryId,
        "Password": password,
      };

  Map<String, dynamic> userToJson() => {
        "phoneNumber": phoneNumber,
        "userId": userId,
        "StepNo": stepsNo,
        "name": name,
        "profilePicture": profilePicture,
        "userRole": userRole,
        "wallet": wallet,
        "priviliges": priviliges,
      };
}
// class UserResponseModel extends ResponseModel {
//   UserResponseModel({
//     super.success,
//     super.message,
//     super.data,
//   });
//
//   factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
//       UserResponseModel(
//         success: json["Success"],
//         message: json["Message"],
//         data: json["Data"] == null ? null : UserModel.fromJson(json["Data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": success,
//         "message": message,
//         "data": data!.toJson(),
//       };
// }
