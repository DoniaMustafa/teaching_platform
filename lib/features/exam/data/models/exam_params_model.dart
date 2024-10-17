class ExamParamsModel {
  int? subjectId;
  int? groupId;
  int? groupSessionId;
  int? courseId;
  int? courseLessonId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjectId'] = this.subjectId;
    data['groupId'] = this.groupId;
    data['groupSessionId'] = this.groupSessionId;
    data['courseId'] = this.courseId;
    if (this.courseLessonId != null) {
      data['courseLessonId'] = this.courseLessonId!;
    }
    return data;
  }

  ExamParamsModel(
      {this.subjectId,
      this.groupId,
      this.groupSessionId,
      this.courseId,
      this.courseLessonId});
}
