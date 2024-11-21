import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/group/group_lessons_details/data/models/video_view_model.dart';
import 'package:teaching/features/sessions/session_video_details/data/models/video_of_session_details_response_model.dart';

import '../../../../../core/export/export.dart';
import '../models/video_details_response_model.dart';

abstract class VideoOfSessionDetailsDataSources {
  Future<ResponseModel> getSessionsVideo({required int groupVideoId});
  Future<ResponseModel> getVideo({required int videoId});
  Future<ResponseModel> addVideoView(
      {required int videoId, required String duration});
  Future<ResponseModel> getVideoView({required int videoId});
}

class VideoOfSessionWithServer extends VideoOfSessionDetailsDataSources {
  VideoOfSessionWithServer(this.dioConsumer);

  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> getSessionsVideo({required int groupVideoId}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getSessionsVideo,
              queryParams: {"groupVideoId": groupVideoId}),
          fromJsonFunction: VideoSessionsResponseModel.fromJson);

  @override
  Future<ResponseModel> getVideo({required int videoId}) async => remoteExecute(
      request: dioConsumer.getRequest(
          path: EndPoints.getVideo, queryParams: {"groupVideoId": videoId}),
      fromJsonFunction: VideoDataResponseModel.fromJson);

  @override
  Future<ResponseModel> getVideoView(
          {required int videoId}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getGroupVideoView,
              queryParams: {"groupVideoId": videoId}),
          fromJsonFunction: VideoViewResponseModel.fromJson);

  @override
  Future<ResponseModel> addVideoView(
          {required int videoId, required String duration}) async =>
      remoteExecute(
          request: dioConsumer.postRequest(
              path: EndPoints.addGroupVideoView,
              queryParams: {"groupVideoId": videoId, "duration": duration}),
          fromJsonFunction: ResponseModel.fromJson);
}
