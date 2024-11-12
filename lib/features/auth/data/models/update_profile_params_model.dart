class UpdateProfileParamsModel {
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? nationalId;
  final int? stateId;
  final int? educationTypeId;
  final int? programTypeId;
  final int? gradeId;
  final String? schoolName;

  UpdateProfileParamsModel({
    this.name,
    this.phoneNumber,
    this.email,
    this.nationalId,
    this.stateId,
    this.educationTypeId,
    this.programTypeId,
    this.gradeId,
    this.schoolName,
  });

  Map<String, dynamic> toJson() => {
        "Name": name,
        "PhoneNumber": phoneNumber,
        "Email": email,
        "NationalId": nationalId,
        "StateId": stateId,
        "EducationTypeId": educationTypeId,
        "ProgramTypeId": programTypeId,
        "GradeId": gradeId,
        "SchoolName": schoolName,
      };
}
