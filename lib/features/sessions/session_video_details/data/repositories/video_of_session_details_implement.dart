import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/lessons_details_data_sources.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/lessons_details_repo.dart';
import 'package:teaching/features/sessions/session_video_details/data/data_sources/video_of_session_details_data_sources.dart';

import '../../domain/repositories/video_of_session_details_repo.dart';

class VideoOfSessionDetailsImplement extends VideoOfSessionDetailsRepo {
  VideoOfSessionDetailsDataSources dataSources;

  VideoOfSessionDetailsImplement(this.dataSources);

  @override
  Future<Either<Failure, ResponseModel>> getSessionsVideo(
          {required int groupVideoId}) async =>
      execute(() => dataSources.getSessionsVideo(groupVideoId: groupVideoId));

  @override
  Future<Either<Failure, ResponseModel>> getVideo(
          {required int videoId}) async =>
      execute(() => dataSources.getVideo(videoId: videoId));

  @override
  Future<Either<Failure, ResponseModel>> addVideoView(
          {required int videoId, required String duration}) async =>
      execute(
          () => dataSources.addVideoView(videoId: videoId, duration: duration));

  @override
  Future<Either<Failure, ResponseModel>> getVideoView(
          {required int videoId}) async =>
      execute(() => dataSources.getVideoView(videoId: videoId));
}
