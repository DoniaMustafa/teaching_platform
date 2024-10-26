import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class ScheduleRepo {
  Future<Either<Failure,ResponseModel>>getSchedule({required String selectedDay});
}

