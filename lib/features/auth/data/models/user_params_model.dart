
class UserParamsModel {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? nationalId;
  final int? stateId;
  final int? educationTypeId;
  final int? programTypeId;
  final int? gradeId;
  final String? schoolName;

  UserParamsModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.nationalId,
    this.stateId,
    this.educationTypeId,
    this.programTypeId,
    this.gradeId,
    this.schoolName,
  });


  Map<String, dynamic> toJson() => {
    "Name": name,
    "Email": email,
    "PhoneNumber": phoneNumber,
    "NationalId": nationalId,
    "StateId": stateId,
    "EducationTypeId": educationTypeId,
    "ProgramTypeId": programTypeId,
    "GradeId": gradeId,
    "SchoolName": schoolName,
  };
}
