import 'package:teaching/core/export/export.dart';

class NotesBookedUnbookedResponseModel extends ResponseModel {
  NotesBookedUnbookedResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory NotesBookedUnbookedResponseModel.fromJson(
          Map<String, dynamic> json) =>
      NotesBookedUnbookedResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? []
            : List<NotesBookedUnbookedData>.from(
                json["Data"]!.map((x) => NotesBookedUnbookedData.fromJson(x))),
      );
}

class NotesBookedUnbookedData {
  final int? notebookId;
  final String? teacherName;
  final String? gradeName;
  final String? subjectName;
  final String? title;
  final double? price;
  final String? currencyName;
  final bool? isBooked;
  final String? noteBookCoverImg;
  NotesBookedUnbookedData({
    this.notebookId,
    this.teacherName,
    this.gradeName,
    this.subjectName, this.noteBookCoverImg,
    this.title,
    this.price,
    this.currencyName,
    this.isBooked,
  });

  factory NotesBookedUnbookedData.fromJson(Map<String, dynamic> json) =>
      NotesBookedUnbookedData(
        notebookId: json["NotebookId"],
        teacherName: json["TeacherName"],
        gradeName: json["GradeName"],        noteBookCoverImg: json["NoteBookCoverImg"],

        subjectName: json["SubjectName"],
        title: json["Title"],
        price: json["Price"],
        currencyName: json["CurrencyName"],
        isBooked: json["IsBooked"],
      );

  Map<String, dynamic> toJson() => {
        "NotebookId": notebookId,
        "TeacherName": teacherName,
        "GradeName": gradeName,
        "SubjectName": subjectName,
        "Title": title,
        "Price": price,
        "CurrencyName": currencyName,
        "IsBooked": isBooked,
      };
}
