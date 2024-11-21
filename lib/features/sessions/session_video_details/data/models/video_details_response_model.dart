import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/sessions/session_video_details/data/models/video_of_session_details_response_model.dart';

class VideoDataResponseModel extends ResponseModel {
  VideoDataResponseModel({
    super.success,
    super.message,
    super.code,
    super.data,
  });

  factory VideoDataResponseModel.fromJson(Map<String, dynamic> json) =>
      VideoDataResponseModel(
        success: json["Success"],
        message: json["Message"],
        code: json["Code"],
        data: json["Data"] == null
            ? null
            : SessionsGroupVideo.fromJson(json["Data"]),
      );
}

