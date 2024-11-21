import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/lessons_details_data_sources.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/lessons_details_repo.dart';

class LessonsDetailsImplement extends LessonsDetailsRepo {
  LessonsDetailsDataSources dataSources;
  LessonsDetailsImplement(this.dataSources);

  @override
  Future<Either<Failure, ResponseModel>> getLessonsDetails({required int lessonId}) async=>
      execute(()=>dataSources.getLessonsDetails(lessonId: lessonId));

  @override
  Future<Either<Failure, ResponseModel>> getVimeoVideo({required int vimeoId})  async=>
      execute(()=>dataSources.getVimeoVideo(vimeoId:vimeoId));

}
