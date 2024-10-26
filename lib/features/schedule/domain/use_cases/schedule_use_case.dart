import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/schedule/domain/repositories/schedule_repo.dart';

 class ScheduleUseCase {
   ScheduleRepo repo;
  Future<Either<Failure,ResponseModel>>getSchedule({required String selectedDay})=>repo.getSchedule(selectedDay: selectedDay);

   ScheduleUseCase(this.repo);
}

