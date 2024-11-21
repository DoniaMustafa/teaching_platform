
class AppointmentParamsModel {
  final int? subjectId;
  final List<int>? teachers;
  final int? groupType;
  final int? timing;
  final int? subscribtionPeriod;

  AppointmentParamsModel({
    this.subjectId,
    this.teachers,
    this.groupType,
    this.timing,
    this.subscribtionPeriod,
  });


  Map<String, dynamic> toJson() => {
    "SubjectId": subjectId,
    "Teachers": teachers == null ? [] : List<dynamic>.from(teachers!.map((x) => x)),
    "GroupType": groupType,
    "Timing": timing,
    "SubscribtionPeriod": subscribtionPeriod,
  };
}
