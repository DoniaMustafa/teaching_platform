import 'package:teaching/core/export/export.dart';

abstract class FavoriteVideoDataSource {
  Future<ResponseModel> addFavoriteVideo({int? videoId});
}

class FavoriteVideoWithServer extends FavoriteVideoDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> addFavoriteVideo({int? videoId, }) async =>
      remoteExecute(
          request: dioConsumer.putRequest(
              path: EndPoints.addFavouriteUnFavouriteCourseVideo,
              queryParams: {"CourseVideoId": videoId, }),
          fromJsonFunction: ResponseModel.fromJson);

  FavoriteVideoWithServer(this.dioConsumer);
}
