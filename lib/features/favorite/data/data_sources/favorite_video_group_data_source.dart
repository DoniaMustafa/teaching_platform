import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/favorite/data/models/favorite_videos_response_model.dart';

abstract class FavoriteVideoGroupDataSource {
  Future<ResponseModel> getFavoriteVideoGroups();
}

class FavoriteVideoGroupWithServer extends FavoriteVideoGroupDataSource {
  DioConsumer dioConsumer;
  FavoriteVideoGroupWithServer(this.dioConsumer);
  @override
  Future<ResponseModel> getFavoriteVideoGroups() async => remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.getFavouriteGroupVideos,
      ),
      fromJsonFunction: FavoriteVideoCoursesGroupsResponseModel.fromJson);
}
