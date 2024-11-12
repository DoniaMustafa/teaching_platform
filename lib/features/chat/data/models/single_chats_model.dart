import 'package:teaching/core/export/export.dart';

class GetSingleChatsResponseModel extends ResponseModel {
  GetSingleChatsResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory GetSingleChatsResponseModel.fromJson(Map<String, dynamic> json) =>
      GetSingleChatsResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? []
            : List<SingleChatsData>.from(
                json["Data"]!.map((x) => SingleChatsData.fromJson(x))),
      );
}

class SingleChatsData {
  final String? name;
  final String? image;
  final String? lastMessage;
  final String? lastMessageTime;
  final bool? lastMessageSeen;
  final bool? lastMessageUserSeen;

  SingleChatsData({
    this.name,
    this.image,
    this.lastMessage,
    this.lastMessageTime,
    this.lastMessageSeen,
    this.lastMessageUserSeen,
  });

  factory SingleChatsData.fromJson(Map<String, dynamic> json) =>
      SingleChatsData(
        name: json["Name"],
        image: json["Image"],
        lastMessage: json["LastMessage"],
        lastMessageTime: json["LastMessageTime"],
        lastMessageSeen: json["LastMessageSeen"],
        lastMessageUserSeen: json["LastMessageUserSeen"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Image": image,
        "LastMessage": lastMessage,
        "LastMessageTime": lastMessageTime,
        "LastMessageSeen": lastMessageSeen,
        "LastMessageUserSeen": lastMessageUserSeen,
      };
}
