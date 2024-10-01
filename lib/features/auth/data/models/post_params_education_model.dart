class PostParamsEducationModel {
  final String? phoneNumber;
  final List<int>? educationTypeIds;
  final List<int>? programTypeIds;
  final List<int>? gradeIds;
  final String? stepsNo;
  PostParamsEducationModel({
    this.phoneNumber,
    this.stepsNo,
    this.educationTypeIds,
    this.programTypeIds,
    this.gradeIds,
  });

  Map<String, dynamic> toJson() => {
        "PhoneNumber": phoneNumber,
        "EducationTypeIds": educationTypeIds == null
            ? []
            : List<dynamic>.from(educationTypeIds!.map((x) => x)),
        "ProgramTypeIds": programTypeIds == null
            ? []
            : List<dynamic>.from(programTypeIds!.map((x) => x)),
        "GradeIds":
            gradeIds == null ? [] : List<dynamic>.from(gradeIds!.map((x) => x)),
        "StepNo": stepsNo,
      };
}
