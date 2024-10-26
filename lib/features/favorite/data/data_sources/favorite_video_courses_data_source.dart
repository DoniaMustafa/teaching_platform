import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/favorite/data/models/favorite_videos_response_model.dart';

abstract class FavoriteVideoCoursesDataSource {

  Future<ResponseModel>getFavoriteVideoCourses();
}

 class FavoriteVideoCoursesWithServer extends FavoriteVideoCoursesDataSource {

   DioConsumer dioConsumer;
   FavoriteVideoCoursesWithServer(this.dioConsumer);
   @override
  Future<ResponseModel> getFavoriteVideoCourses()async => remoteExecute(
      request: dioConsumer.getRequest(
          path: EndPoints.getFavouriteCourseVideos,
      ),
      fromJsonFunction: FavoriteVideoCoursesGroupsResponseModel.fromJson);


}
