import 'package:teaching/core/export/export.dart';

abstract class FavoriteVideoDataSource {
  Future<ResponseModel> addFavoriteVideo({int? videoId, bool isCourse = true});
}

class FavoriteVideoWithServer extends FavoriteVideoDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> addFavoriteVideo(
          {int? videoId, bool isCourse = true}) async =>
      remoteExecute(
          request: dioConsumer.putRequest(
              path: isCourse.isFalse
                  ? EndPoints.addFavouriteUnFavouriteGroupVideo
                  : EndPoints.addFavouriteUnFavouriteCourseVideo,
              queryParams: {
                if (isCourse.isTrue) "courseVideoId": videoId,
                if (isCourse.isFalse) "groupVideoId": videoId,
              }),
          fromJsonFunction: ResponseModel.fromJson);

  FavoriteVideoWithServer(this.dioConsumer);
}
